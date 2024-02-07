Return-Path: <SRS0=/fMc=JQ=chromium.org=nhebert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663B4C4828F
	for <linux-firmware@archiver.kernel.org>; Wed,  7 Feb 2024 19:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D1F1C433F1; Wed,  7 Feb 2024 19:42:59 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4735FC433C7
	for <linux-firmware@kernel.org>; Wed,  7 Feb 2024 19:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4735FC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d98fc5ebceso6924815ad.1
        for <linux-firmware@kernel.org>; Wed, 07 Feb 2024 11:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707334977; x=1707939777; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9dSPmQdouRR293fH+Hq9dDaCJAbWPO1pkBqun3JWnzw=;
        b=VG07nymnvHgS7I5qOxjMyt8nVtXn7VozZZwbzl6jX7Rg0jYOs2GCbPvG/SFxJwR8gX
         vzwazPIv6BDyn+9IMlYHRTJDXXHbXuHOp+/aodOXb0QCQBnj68H/+LTVn3oKYUcKIFrz
         gKlOg3v9omgBQWxKgVgvBY8MEeK/t+NtFYJ+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707334977; x=1707939777;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9dSPmQdouRR293fH+Hq9dDaCJAbWPO1pkBqun3JWnzw=;
        b=CZRGQwXqzMdCGlAOaqhW0Zo6Rl5K3wwIkWbZbW5m8n6Xn0WlJfDU3pZJMqH2JCswn5
         1GdRnqWSAOqd6R2RfWvgti6SmWWbnOwoF7KdhAQAsfzrZXBowcBO7bkm3cXzKzI4XOq7
         2m6Wfx33/8u1gNsqwEJjbMPKmE9RmVMQlVUh0ee0ltdtUnfwhib0DfQrV6XhcUYlcVbk
         ZwSO92V80aYXI0sJTgg8r8RTQUi/6pyiL2AiSQcANYYBriaQm/znSwSAha7m4dRHwMJF
         neASKNUrhHiIAZnvznmCZ+bNrIeWLGhRGZ2J2VhUFaCKD3VLsbhU+DL7xR3WCfpUA1JC
         EobQ==
X-Gm-Message-State: AOJu0YwOrLlUWlnRH4pfnOtKxeT9RhRW4BauPbWROg3oxyqwooOW5gES
	b/WL4c8RvfKt+BaMljSRU6JZNQaX82FhdjyhPRIHjtuupVuTu3vesSbV1SkK0CbrlnMrEIw163E
	EN5+SWnyduG3ZGJ55xw/zai+OjIw9WLzg/Vmi/v7M/cJOnTGZGQ==
X-Google-Smtp-Source: AGHT+IFlwmKheScXxwcWxqvbwwwXxcbYu7LCXRFPdDg0seznp9RKCmI7XWNl9TBBgBi1LQukU833vFbf3w0qLe/pc3k=
X-Received: by 2002:a17:903:94e:b0:1d8:fcac:eff0 with SMTP id
 ma14-20020a170903094e00b001d8fcaceff0mr7297559plb.9.1707334977355; Wed, 07
 Feb 2024 11:42:57 -0800 (PST)
MIME-Version: 1.0
From: Nathan Hebert <nhebert@chromium.org>
Date: Wed, 7 Feb 2024 11:42:46 -0800
Message-ID: <CANHAJhGVU=h1+4WLMW-LW=U5-+vXozxkp-HC=CcCbXUHCZqd_g@mail.gmail.com>
Subject: [PULL]: qcom: SC7180 venus firmware update
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, Fritz Koenig <frkoenig@chromium.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit b4b04a5cbcbb0f67d0d63fa66aa68f32b9dc5fa7:

  Merge branch 'amd-staging' into 'main' (2024-02-03 04:45:27 +0000)

are available in the Git repository at:

  https://github.com/nathan-google/linux-firmware.git sc7180_vp9_decoder_fix

for you to fetch changes up to 52ac76144aa006c284e509cbb02772c9264bfd15:

  qcom: update venus firmware file for v5.4 (2024-02-07 11:15:07 -0800)

----------------------------------------------------------------
Nathan Hebert (1):
      qcom: update venus firmware file for v5.4

 WHENCE                   |   2 +-
 qcom/venus-5.4/venus.mbn | Bin 921236 -> 922240 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)
