import 'package:projectile/projectile.dart';

import 'config/env.dart';

class GPTClient {
  final projectile = Projectile(client: HttpClient(config: const BaseConfig(enableLog: false)));

  Future<String?> getPageSummary(String url) async {
    final response = await projectile
        .request(
          ProjectileRequest(
            method: Method.POST,
            target: 'https://api.openai.com/v1/chat/completions',
            headers: {
              HeadersKeys.authorization: 'Bearer ${Env.openAIKey}',
              HeadersKeys.contentType: ContentType.json,
            },
            body: {
              'model': 'gpt-3.5-turbo',
              'messages': [
                {
                  'role': 'system',
                  'content': 'You are text summarizer tool',
                },
                {
                  'role': 'user',
                  'content': 'Please summarize this article: $url',
                }
              ]
            },
          ),
        )
        .fire();

    if (response.isFailure) {
      return null;
    }

    final json = response.data as Map<String, dynamic>;
    final completions = json['choices'] as List<dynamic>;

    return completions[0]['message']['content'] as String;
  }
}
