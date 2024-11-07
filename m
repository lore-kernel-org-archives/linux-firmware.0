Return-Path: <SRS0=khc7=SC=gmail.com=zenmchen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242BED5AE6B
	for <linux-firmware@archiver.kernel.org>; Thu,  7 Nov 2024 07:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E48C5C4CECD; Thu,  7 Nov 2024 07:07:13 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 222ADC4CED2
	for <linux-firmware@kernel.org>; Thu,  7 Nov 2024 07:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 222ADC4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20c70abba48so6709815ad.0
        for <linux-firmware@kernel.org>; Wed, 06 Nov 2024 23:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730963232; x=1731568032; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXwvkzuMSWisEHYi6gtfRWt+2t/5l3MicfA9CZimLuQ=;
        b=Rz4iRF2QktwkPudIC6nC7emJ2ngyKO64fdxoCm7kSwFFuDw6iQTJXaFfzwwTvIkBty
         erFax4bd2vHsTqG+oXcnfxEdTm8Z5rZGrVo4/PHbHj0OJUiM2jUecUIvGG5LccnazbmL
         /vBiq9MUNDxH7LN+NZ6HowL+2MWCfbL3nIPo1WC5CtCly7eksnFrZQdldOrwVqeqwYqf
         AFV1SYsCYUgEms2FDxGJ2AI6cUD0df5bqvo1mnCuYgh+dU0myR5OW4bAVSdLz27O2VjM
         UZBskh11J/neHPHc60feu742OETH2CzEgu4teNX7LKoVWEx+eg3mNZoSJHZmCgAiqtj0
         P6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730963232; x=1731568032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXwvkzuMSWisEHYi6gtfRWt+2t/5l3MicfA9CZimLuQ=;
        b=EByZfM5jU23+YgCWL6MXu3lApEWlKmEvWnP1Kz11WCFkldKz6a8XzgSueKZLs1a/qS
         Zat4bBOGo8aAjg47/dRr3DJsDxEfhPj32NkDg/aXum/UFdtZ8xlqTcR4tFRFcQdPX+6m
         JBQPQ/zXJlRQwOHXb8jn5kSJoGuTSXyZRCcr9bNa0quN+lSg/IrBs28ic6vtpMKqbJtq
         VO/SqpfqSfo6UOWQtCp+aUhDdnuyuF6dcMNIvdmcaDJcCsK4MN36qrMIpjdjspNjNcxP
         BzjprpWA/Mg7anTwcZawGQgcxRdraNq1hJ68IEW9HWZbo7Fk0UTaC7VmaB/uS+J40FQr
         mLCA==
X-Gm-Message-State: AOJu0YxbBECDjbKJTkc0wEasxfBbCXj7m6tYQ/31Zm0ZEcVw0DcnjDn4
	tJ20YbgRx6S6jd9psRFtGw+cqqlkST6qqvNLBT5P/okqY27zILHcUQzG6Q34aoQ=
X-Google-Smtp-Source: AGHT+IG7IOCRivpdcJe2O+DzhjtHX7RPugR1UINku9p6l+02xj3o//FPA3Ns9jYNQ04QZBy3n45vbw==
X-Received: by 2002:a17:902:da83:b0:20b:5ea2:e06 with SMTP id d9443c01a7336-2111b018c41mr302354805ad.56.1730963231495;
        Wed, 06 Nov 2024 23:07:11 -0800 (PST)
Received: from localhost.localdomain ([1.200.146.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21177e45ef0sm5621315ad.153.2024.11.06.23.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 23:07:11 -0800 (PST)
From: Zenm Chen <zenmchen@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org,
	pkshih@realtek.com,
	rtl8821cerfe2@gmail.com,
	usbwifi2024@gmail.com,
	zenmchen@gmail.com
Subject: RE: [PATCH] rtw88: Add firmware v52.14.0 for RTL8812AU
Date: Thu,  7 Nov 2024 15:07:07 +0800
Message-ID: <20241107070707.1438-1-zenmchen@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241107004830.14261-1-zenmchen@gmail.com>
References: <20241107004830.14261-1-zenmchen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> This file contains the firmware for RTL8812AU and was was extracted from

Hi Josh,

I found I typed one more "was" in my commit message, could you please fix 
this typo before merge the patch? many thanks!

> the vendor driver v5.13.6-23-g232107d9b.20210820 from
> https://github.com/morrownr/8812au-20210820
