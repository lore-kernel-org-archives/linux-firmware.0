Return-Path: <SRS0=xWuV=I5=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEEBC4725D
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Jan 2024 11:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 87778C433C7; Fri, 19 Jan 2024 11:28:24 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BBA26C43390;
	Fri, 19 Jan 2024 11:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BBA26C43390
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40e87d07c07so7600955e9.1;
        Fri, 19 Jan 2024 03:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705663702; x=1706268502; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zCRYb66Z6JDl85phy7f5K03ztguKvaYAebKDAlKz+hc=;
        b=dbUq1rO6t1O6F6tn5z3cq6PhQ1vPlnIRAqyqqvANXZGKt6y1xaComirB9WXYQvMavd
         vvgKw3WxcofLDPXF9KLhho+C1bIDcO+0CMHNvubPf7LhPiReTP95RE1tMvErMgpN6fSz
         nYvMGrM3huWGDhntGmBJ6oHjK2fWYlV0YYDfIZAWww3sRrdakHzHJC+9JvOQi7vu7vgH
         oPwizzDIj++nNPh0UpZjzdgeMMpurKFWmjB94DLzu9OL4qymkZ9a5mP0g7uzDwQRWDSn
         KhdvEkvaj08AP1kvWxNDZjmlisMNaC2rlne19vHTJeD0jHa486l3kGT7Lk6fiPR6rItS
         ifuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705663702; x=1706268502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCRYb66Z6JDl85phy7f5K03ztguKvaYAebKDAlKz+hc=;
        b=rJrpvbh9NGejjUFRL+dbHmeXoOnTa5e5cnviDP/VD5whRHjThBNN9Nq9pfnYUM7sL5
         Z7VmaRoPTbQADe1XhqlctG1FmXQE87FY1l75U3/CaTq7p8Lj7At/6dGXFkQPYOE8e+tL
         UH03hbxsnscrHQ5KjQh2Y/jn3JZnWshnwqf/A2kHdic96iuIIElc7hDqk/Z1oIxlRs4O
         W15nD1o0qYYwND+sdNYfbb2YcvwXZ204APTcORROFpiyhoLJBtxLj1e0sgLt29P8oNok
         dd3PXkxuggU1zerA5y6l9jncWn5Ri27KEMDcymaYD/bYv7FFeaAADTQ3SjOn1zwtk6wK
         dIkA==
X-Gm-Message-State: AOJu0Yxl7xYIS80hLns8yCVlwc9B/IZkjax6QJ4abSYEfFJL4MvgH1RU
	Qm5BzFB6p1NdAThk5qRZzXyPzpYYCajYvesxq/64/rviW1KW/BdWGIH6Edbc
X-Google-Smtp-Source: AGHT+IG1jhTnF82gY72OYOIANSJUxSylR++lmTzTOHe1tmfhL8BK6nikjOrKks7UR6O/9ELXxxKGqw==
X-Received: by 2002:a1c:4c0e:0:b0:40e:640c:3b67 with SMTP id z14-20020a1c4c0e000000b0040e640c3b67mr1466422wmf.138.1705663701706;
        Fri, 19 Jan 2024 03:28:21 -0800 (PST)
Received: from morpheus.home.roving-it.com (2.1.9.e.d.3.3.1.6.1.e.d.5.3.a.e.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:ea35:de16:133d:e912])
        by smtp.googlemail.com with ESMTPSA id fc11-20020a05600c524b00b0040e86fbd772sm10032513wmb.38.2024.01.19.03.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:28:21 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Subject: [RFC] cpia2: add EOL entry for firmware
Date: Fri, 19 Jan 2024 11:28:16 +0000
Message-ID: <20240119112816.527360-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cpia2 driver was removed from the v6.3 kernel so add an
EOL entry to WHENCE do we can track this so the FW can be
removed when the v6.1 LTS kernel goes EOL.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---

Seeking a way to document this upstream so it can be tracked
in a central location so I'd like feedback if this would be
a reasonable way to track this information?

 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index 9db8b41f..446067b1 100644
--- a/WHENCE
+++ b/WHENCE
@@ -274,6 +274,7 @@ Converted from Intel HEX files, used in our binary representation of ihex.
 --------------------------------------------------------------------------
 
 Driver: cpia2 -- cameras based on Vision's CPiA2
+EOL: v6.3
 
 File: cpia2/stv0672_vp4.bin
 
-- 
2.43.0

