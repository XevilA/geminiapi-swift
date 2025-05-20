 private let geminiAPIKey = "APIKEYHERE" // <--- ใส่ KEY ใหม่ของคุณที่นี่!!!

    private let visionModel = "gemini-2.0-flash" // หรือ "gemini-1.5-flash", "gemini-1.5-pro" (ตรวจสอบรุ่นล่าสุด)

    private var apiURL: URL? {

        URL(string: "https://generativelanguage.googleapis.com/v1beta/models/\(visionModel):generateContent?key=\(geminiAPIKey)")
    }
