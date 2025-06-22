Return-Path: <SRS0=bxGE=ZF=googlemail.com=martin.blumenstingl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D549C7115A
	for <linux-firmware@archiver.kernel.org>; Sun, 22 Jun 2025 15:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 221FDC4CEF0; Sun, 22 Jun 2025 15:48:58 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2A52C4CEE3
	for <linux-firmware@kernel.org>; Sun, 22 Jun 2025 15:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C2A52C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-addcea380eeso567872866b.0
        for <linux-firmware@kernel.org>; Sun, 22 Jun 2025 08:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1750607335; x=1751212135; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ykytJ19qhLnLNbAMsXtAq9tDXr6uJ5hDujPOGMEyyok=;
        b=NrHw3kDf1LsWor/nMV2ip4KRXXptlyTfbAUilM6dhcc3ptwfDErrydZbfegWOvKQ0b
         1IJnBvXMxCvjNZGkdwVnJ+OhFiQDRAcJLJ52cQJ8DB2EDz8IDQPIoUDUhPpM0bYXO3uP
         Bh0i6/e1tDDg8Zph8OJ3cYm87xZEBGhRr114WgTzVaM88kuVQhyoxprkKWUkN9Z2UTCS
         pFlsJQDf2w8UcurdJ2IEHgJtw0kMJa3xH+Oq5tBPS335jOevfmSDocqrMWzGSkhEWK4r
         b/vTE+bWYutVNA1qXMG4UZl77SRbPxcjooBlx6sD8J9xlxyfKmn0CUS2nzvGrFef4gcx
         k+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750607335; x=1751212135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykytJ19qhLnLNbAMsXtAq9tDXr6uJ5hDujPOGMEyyok=;
        b=T6XP+f8mtXAo15jFShj6rUDJCPhrNEFnAvYEU1faJxc7bhpVInncnddtYDDbuulU6E
         3FDismKhZra8g7Ms6OHt/sTMgS3EEkhGwGP0FlCakusAT171W5wuWsJYvhEV+ERoriup
         UnW5rxLDqjN4UdizBNCPMgWp0+grVwfGw85oWCnx/xcZG1ukewo0/+MuB5jWC8lcxBHg
         cS3vXjBnYxleOquWhxlhLs4E51Dvg9tCfmdJfQbOZbBEXOSumiIs60aFczY0Or6Yspxp
         x30Jz+nFbYaAMU/P7V+Ke+6wZW12AS8CrV6MvZTgyQ/K5SI9QdZHIBaSHz1h9BPiAs4A
         pWGg==
X-Gm-Message-State: AOJu0YzBVElzbuOlDZmoUwnL4EqsvhhN8Q+dVQL2e7OzRl3V70tu9yy9
	CpMoLREUGvATTY0/xDSYY8Bt6n/y0BcP7JJylWWMNnvYmtTafXSgQpQ3nIRV4A==
X-Gm-Gg: ASbGncu/qyLs8KDp1ENkeDtoCfj9NZ2ZZKJRdHlN85GxruvYKZD7FHqY5PL3ZdlzC5l
	UVuJKFNZ9rh14Bp8Z54FF6qCnFcj6SFdU6AjBVQvsnZVDDJvqbmelwBxJopsDp4kME9BcK1Zw1l
	2fylMYCVYJxmB+9KYk0cdg+dL320VbKl3wooaaaRoEtiprDic4QJwmSWXyvIWLmpuggur6eEb/f
	KzkfB545b36qWvRR7PyS5qPwf3cNDhubjszi1DZxhhVomuEqRu9sqMUzlJeKHO4TwGOVoFliLGH
	jkTW/osSSnT2zySZrNr7RPj/K8YrasmMEJ5Rdy5D3QjpKdBiuKJANC+m8sDQ994vk98azh7jE9D
	uG5jKgOPlgotVQDJ76ABr0laJSXAvjAkQBI4wj34zP58xfm+YMX0J77p3PLtDHsACek7MFgBH+A
	LjfajGpxILb4Zw
X-Google-Smtp-Source: AGHT+IHJ9GFpJ7wQiVduVXrIuQj9XRGcrJhLJVSE4rJlPRZny3FaOvEOkIjlhvd9Vu48g9iTkm8zXQ==
X-Received: by 2002:a17:906:c154:b0:ad8:a935:b8ff with SMTP id a640c23a62f3a-ae057ef75famr1019225866b.31.1750607334317;
        Sun, 22 Jun 2025 08:48:54 -0700 (PDT)
Received: from blackbox (dynamic-2a02-3100-b1e8-3900-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:b1e8:3900:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ae05408301fsm557509466b.96.2025.06.22.08.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 08:48:53 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] brcm: Fix symlinks for Khadas VIM SDIO wifi config
Date: Sun, 22 Jun 2025 17:48:36 +0200
Message-ID: <20250622154836.2231776-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the duplicate "brcmfmac43455-sdio." part from the symlink target.

Fixes: c629575aa5ce ("brcm: Add symlinks for Khadas VIM SDIO wifi config to AW-CM256SM.txt")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
I tested it with the correct symlink locally was wondering why the
latest linux-firmware package (from the Arch Linux) repos did not
give me wifi functionality. It turns out I failed at copy & paste...


 WHENCE | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/WHENCE b/WHENCE
index b43d6ef7..3b69b759 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3117,7 +3117,7 @@ Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356S.txt
 Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP6356S.txt
 File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
 Link: brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
-Link: brcm/brcmfmac43455-sdio.brcmfmac43455-sdio.khadas,vim.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.khadas,vim.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
 Link: brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
 Link: brcm/brcmfmac43455-sdio.pine64,pinenote-v1.1.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
 Link: brcm/brcmfmac43455-sdio.pine64,pinenote-v1.2.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
-- 
2.50.0

