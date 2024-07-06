Return-Path: <SRS0=hRSS=OG=gmail.com=stuart.a.hayhurst@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2091FC3271E
	for <linux-firmware@archiver.kernel.org>; Sat,  6 Jul 2024 00:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E63E3C116B1; Sat,  6 Jul 2024 00:50:36 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22E54C32781
	for <linux-firmware@kernel.org>; Sat,  6 Jul 2024 00:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 22E54C32781
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42561c16ffeso15272335e9.3
        for <linux-firmware@kernel.org>; Fri, 05 Jul 2024 17:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720227034; x=1720831834; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjcatJzrKY+zgPSsW0kQGkVslVDge9AGFKuusDrivWY=;
        b=j4UiYvlrmiYy9XXMbUEzOx/XIri3Y99nQ/7gNb0if2pmWdSztpl4it47j+MmlKFyjG
         K76pEUNcJzQ/ICRwEXvRnO7JQ2+nv+/LD5aguIMd05zZqry4u38tLJwJu586er9d3TQn
         loLs1gSowMrtrG+/QEp8pubtIGAjWfkcsKFpy1/aoZ+faTPJKz4UuD7NMT9j4pJ/GSlB
         G3Yz9xbLm1hWazSLWZW5fdVcovpDiw55bU+MuWaiaKIxxVhUDQETKOF0zLVX78Ac/YxB
         R3AX58v6UJ0/uwZAAmEutK5lTwfq2MP4uXAXYpBVsKbrNwaOvEdpbnEmYQNv8NsJbT7J
         1wDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720227034; x=1720831834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjcatJzrKY+zgPSsW0kQGkVslVDge9AGFKuusDrivWY=;
        b=vvM2YAsx1OaZ7MzjrcRl7QC0E6rUZd6bi2L3BAr05i/b5H5jqBmLioDi8PmtVVIn/m
         NIwpNVf3mMDN+/8y5hGxWf6e1YRlIoAFdbx6ArwrC6qpFfKFNhVX9oE562r2byRkbpQh
         zkhhOV5dR92LQsdVOT25xRNmhA8tUMFxHvAZPC/BJIdHVvcASE5SEeAJUFW/886uOkxL
         kYxwqJYC4AyqHjAsvx29vH/jtSEk2nyLXbWFKLqbM13/HbbhFSN4BGn4VRoFlMMQchJ1
         peYNNwF1hhpAKxm5zlKggUdc7Kn2+SBRpVvuhq3Ki4aBTeXQsvkGvO9gouu/Qygy8+AV
         ryPg==
X-Forwarded-Encrypted: i=1; AJvYcCWSQdd5BUK3oi0ZE4e3XaD3FORGTo9e88B2dBOvsagj+jpxWW2nvuXcm4bzp8PjssJ/0Y+fPpv5mdbqfM5lSMKrrj1DSaZHv4qS
X-Gm-Message-State: AOJu0YxFt6znM/Js1qXrXQz5Oy7Oh70PVpHIWHfvNx+EuVS6Me6ndNKy
	rPda6HojU5aQcQLGmOqHCbxZVAz6D9tYrR8TCCygdvCaqYEZzM2c
X-Google-Smtp-Source: AGHT+IGjYxkTgAFMYrAOqGcyo3iB+xYZ4rGSdz+l/S/21bkE/VIF1e54TQdkswJKtFRzX8Rafy6TwQ==
X-Received: by 2002:a05:600c:4c15:b0:426:59ec:17a2 with SMTP id 5b1f17b1804b1-42659ec1a4cmr13105125e9.33.1720227033989;
        Fri, 05 Jul 2024 17:50:33 -0700 (PDT)
Received: from localhost.localdomain ([188.74.74.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367a54f237bsm3382369f8f.16.2024.07.05.17.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 17:50:33 -0700 (PDT)
From: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
To: shenghao-ding@ti.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: 13916275206@139.com,
	baojun.xu@ti.com,
	kevin-lu@ti.com,
	linux-firmware@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	navada@ti.com,
	peeyush@ti.com,
	soyer@irl.hu,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Add dsp firmware for different laptops
Date: Sat,  6 Jul 2024 01:49:43 +0100
Message-ID: <20240706004942.39403-2-stuart.a.hayhurst@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <23e85f35969447ab9161068f2c159845@ti.com>
References: <23e85f35969447ab9161068f2c159845@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following up on this again, is the licence correct here? "Allegedly GPLv2+ but no source visible" doesn't sound right for something straight from TI, and it can't be distributed in Debian either (see https://salsa.debian.org/kernel-team/linux/-/merge_requests/1033#note_471478 and https://salsa.debian.org/kernel-team/firmware-nonfree/-/merge_requests/96#note_504454).

Is it supposed to have a binary redistribution licence, such as the licence in LICENCE.ti-tspa (https://gitlab.com/kernel-firmware/linux-firmware/-/blob/main/LICENCE.ti-tspa?ref_type=heads)?

Thanks,
Stuart
