Return-Path: <SRS0=tCgH=CV=chromium.org=druth@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2558FA1FFF
	for <linux-firmware@archiver.kernel.org>; Wed, 22 Apr 2026 22:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0D57C2BCB3; Wed, 22 Apr 2026 22:17:42 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E99DDC19425
	for <linux-firmware@kernel.org>; Wed, 22 Apr 2026 22:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E99DDC19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9c01854477so8379566b.0
        for <linux-firmware@kernel.org>; Wed, 22 Apr 2026 15:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776896260; x=1777501060; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9nCNK53rTjLnVysfgXoglxvrQ8+xq11LiIZcoNznmu8=;
        b=UF9/QH1ysYfs9Vf5LAXW0uRGvvF/G/zPSLUFiduHpO8MrOU6agzLOJd4tWmopV5aAJ
         fhKIpE+f/UE2N3MMsLCrF4tKER5H024WEvQqUGe+a51fVZRK6QjzOYD5Ewo+2z/KNr3m
         wPvcOy4hSowKr5UuSGRIjIGj+gJU4NpzudQTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776896260; x=1777501060;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9nCNK53rTjLnVysfgXoglxvrQ8+xq11LiIZcoNznmu8=;
        b=L8nX5VHVXu4nFOi65ThJfxEz+hPmUwaiBE3QNdt+XxSK+dUFPswuNvIbs5RbPovyXB
         LHG8WspYFIIm+2Mod79mfFfhoHuba3Monfr9FpBD7n0ffhJ7z3z5n9w2dEnW2rlw9WvG
         MYzjiansZe0TLEHoPDHmvo4x/856fPEiB5CBzNhFLmWgVg09fj5FA+ceTtJPKBhdL9dS
         pHFAg9LAuOntp7QAKkYwnSLgT43t6z5an2GgAeLeZSqeowCpSmbnurtYqpzs6HKkXRbr
         tPPetSf17DMJ4pS8URwPtr6xUnqG11ougvvvu3z6xTXxIR1FmDQ54JkEDBvgsDqT94fV
         ecgw==
X-Forwarded-Encrypted: i=1; AFNElJ+vsn1V8cn1DMh/NRrqybWcTmx9OrNa6j5e5zaNcMqLtJbbGDuDDSSL1gSU4aP5TKUv2t8DT7se3ETYXhLuVA==@kernel.org
X-Gm-Message-State: AOJu0YxSgSFyQB1FVq+rd/x1O5CzDcBZ+3gTWnHhFy8bVDC9Th1lRvlw
	TtHDZ6W3+FmHjB7MUsxKouO8cJ3iE2rzLB0J3CoU1eEHLOEVUwExV4LU9gGXMamCk/F9X8zJB6y
	GEjI=
X-Gm-Gg: AeBDietzirJukFuddBRqTTgNYcQqafNHH23z7SeA/uda23F2jXNMhi9EvZjZr0IVMJZ
	FrWPC2FTRQv5KgNRDfTBchRoTBAGRuoBgQl3mcCnZkXOZCqM7kySpUEffcPTRhnRqe0TRdWrtEh
	E/AMP4MYBrNg+W3CpKOi34UOTqQOk8F1vw50BoVQd7rtsrIYx7pU89KNifxuUbhuobBurHKA3Do
	+Onx6Sci7CAPluoPPSdKr1WTe43jWr1cvZv3+fBsBUaHXP9eu0o+UW/Fn5/9X2GYnG8UJTVXJ+r
	GyfgR7MlLarJdBKxhixVF+u0pRGzgUlwLOg5r81gzMxHXrWztjior8fv+Cc4VoDF3fvDCkXd6PL
	WvfdfBcMCkeORehmTGWQ2rsHK62UQBBiihwhknswyjEPrzMJzwCHkLBTQWWaaJkZkddR9TvqR9B
	pHn58vuQ5b7GkLsRfycF0DO1+l944Em8cDFPoFNorS/eKqYo0keKdG8E/uvHhT2zuRLq8x
X-Received: by 2002:a17:907:1c91:b0:b9c:6ef1:ed14 with SMTP id a640c23a62f3a-ba41e4fc65bmr1400855466b.36.1776896260058;
        Wed, 22 Apr 2026 15:17:40 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd24sm582778166b.32.2026.04.22.15.17.39
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 15:17:39 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso24248365e9.3
        for <linux-firmware@kernel.org>; Wed, 22 Apr 2026 15:17:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+qGCFTtdqxpAzBPpcs3Mde4Iwn2y7rT5bLJttWKa6P20I7T43TCFXo4V4H45BY0d4mWPqhlrPgtAMSaUq6vA==@kernel.org
X-Received: by 2002:a05:600c:a303:b0:48a:5576:a28a with SMTP id
 5b1f17b1804b1-48a5576a618mr103376955e9.0.1776896258365; Wed, 22 Apr 2026
 15:17:38 -0700 (PDT)
MIME-Version: 1.0
From: David Ruth <druth@chromium.org>
Date: Wed, 22 Apr 2026 18:17:00 -0400
X-Gmail-Original-Message-ID: <CAKHmtrSaDR4fBxN0mvEzYPHoOwr2rrtnOJW6fsrxzsBAeHTjQg@mail.gmail.com>
X-Gm-Features: AQROBzBzddXPT1XEE_H0hC-sWHZhTnR-Xrt8CI9iRdJBAaqlan9vsGglE4T7Hzw
Message-ID: <CAKHmtrSaDR4fBxN0mvEzYPHoOwr2rrtnOJW6fsrxzsBAeHTjQg@mail.gmail.com>
Subject: Re: [PATCH v1] mediatek MT7925: update bluetooth firmware to 20260414153243
To: =?UTF-8?B?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <chris.lu@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: ben@decadent.org.uk, dwmw2@infradead.org, johan.hedberg@gmail.com, 
	jwboyer@kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-firmware@kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, marcel@holtmann.org, 
	ss.wu@mediatek.com, steve.lee@mediatek.com, will-cy.Lee@mediatek.com
Content-Type: text/plain; charset="UTF-8"

Tested-by: David Ruth <druth@chromium.org>
