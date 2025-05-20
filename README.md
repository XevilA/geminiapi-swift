## 🚀 ตัวอย่างการเรียกใช้ Gemini API ด้วย Swift

### 1. 🔐 ตั้งค่า API Key และโมเดล

```swift
private let geminiAPIKey = "APIKEYHERE" // <--- ใส่ KEY ใหม่ของคุณที่นี่!!!
private let visionModel = "gemini-2.0-flash" // หรือ "gemini-1.5-flash", "gemini-2.0-pro"

private var apiURL: URL? {
    URL(string: "https://generativelanguage.googleapis.com/v1beta/models/\(visionModel):generateContent?key=\(geminiAPIKey)")
}

func sendPrompt(prompt: String) async {
    guard let url = apiURL else {
        print("❌ URL ไม่ถูกต้อง")
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    let requestBody: [String: Any] = [
        "contents": [
            [
                "parts": [
                    ["text": prompt]
                ]
            ]
        ]
    ]

    do {
        request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: [])

        let (data, response) = try await URLSession.shared.data(for: request)

        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
            if let responseString = String(data: data, encoding: .utf8) {
                print("✅ ตอบกลับจาก Gemini API: \(responseString)")
            }
        } else {
            print("❌ การตอบกลับจากเซิร์ฟเวอร์ไม่ถูกต้อง")
        }
    } catch {
        print("❌ เกิดข้อผิดพลาด: \(error.localizedDescription)")
    }
}
Task {
    await sendPrompt(prompt: "อธิบายเกี่ยวกับอาหารไทยยอดนิยม")
}
```
