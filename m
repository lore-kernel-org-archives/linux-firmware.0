Return-Path: <SRS0=fOYR=QV=gmail.com=fujita.tomonori@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BD2CF9C5B
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Sep 2024 05:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5F2EC4CECE; Mon, 23 Sep 2024 05:07:05 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B0B08C4CEC7
	for <linux-firmware@kernel.org>; Mon, 23 Sep 2024 05:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B0B08C4CEC7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7db12af2f31so3284073a12.1
        for <linux-firmware@kernel.org>; Sun, 22 Sep 2024 22:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727068024; x=1727672824; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLwuoBI5VX+7K+YtjB6i/XbI6WGEbUWdREYizI9inkw=;
        b=FBs+l3cO86X5FrbAw91F9XAi4MZmM8ipymOWea0UaGfSVkdjaFXC2kW3M1JOBcje9f
         DlSpf30b69HN9rdea7KeQRBLOprkPK3gWhrZvArNnO+aK/QpzrNymR55I0kTfdEzhOeW
         PbiCL8QwOQiKTWHRZyREuTWAYVvU83H3EbJVh/K1qPrJsqAIoH2rzKQQm/5UXgz1492s
         24mFbBATo6sigoIo4Mqg6Hl2ABEX+sfnvN9CZizCDNo6ZsjYjrDCMPjYEAoTeVTWRdNn
         FClTxqXKfuTFOFg6KzVYf3SF/BUtUh8gkEdM3qWCL4fvv5WP8bITAeO1/Emf9nB62Vvv
         M6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727068024; x=1727672824;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nLwuoBI5VX+7K+YtjB6i/XbI6WGEbUWdREYizI9inkw=;
        b=sLHSbwxItyCwaLt934BLVlnW3J+2qmywM+FrDMiAudaUsOPiXqZjB5z966CO1KRlCu
         68wSajjELTBUj3kimkuVhpUsDpbdZ4ubRUsHF89umVYnMR1fjDiHkCxKVdu26rB4CbmS
         DyHq/CGf4JPI1glJm8N2Wp8dyQ5xsv9ttYpdLzejPB6h011PKgJKjZhQgHFreBpCZWhD
         JG5q4xOWHDz8KffbJWUQcBlevpLc/fjcdxgR+SwNwWXtYEz3cEwSzdAchhb7RWsq+fe7
         gAUu2Hwlxez23dOsij7S/lkdvmvgPV8oMRuStJuXlwLKBHGFeSKdDhCtTZjDSh/TvC/V
         W1eg==
X-Forwarded-Encrypted: i=1; AJvYcCXu1BR+f9jdqzV51PHZIDvPl8uhAmmSuz3a55pHQvEg+Qp/+PewJvCmwkEGmx1/waOiZmul+Bdv7aggkCeJow==@kernel.org
X-Gm-Message-State: AOJu0YxJ1SjRmlZS465YC1T7vYO6wBKGvXCMlV0IZwNGU+PudS6x9rpW
	2gHEEg1uZKJtw41BxH4kPxmgQroMYiMcGdv97lUMDUrEndnSQ8kP
X-Google-Smtp-Source: AGHT+IHEVTHUnXRsZ1+CzxZNs0gnJd50N6Pun3etsI171Wp36fXLgacmbmjU54IK9hEUFqWu/C8eJw==
X-Received: by 2002:a17:902:dacd:b0:207:14d1:8270 with SMTP id d9443c01a7336-208d835231dmr189354835ad.16.1727068023733;
        Sun, 22 Sep 2024 22:07:03 -0700 (PDT)
Received: from localhost (p4468007-ipxg23001hodogaya.kanagawa.ocn.ne.jp. [153.204.200.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079460111asm126518185ad.90.2024.09.22.22.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 22:07:03 -0700 (PDT)
Date: Mon, 23 Sep 2024 05:06:51 +0000 (UTC)
Message-Id: <20240923.050651.1829650131953275090.fujita.tomonori@gmail.com>
To: dmitry.baryshkov@linaro.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: fujita.tomonori@gmail.com, linux-firmware@kernel.org
Subject: Re: [PATCH] Add AMCC QT2025 Ethernet Phy firmware
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <dgdqakvmsezdusggiv3c53a3m64nwe2ybhgfv2dm5pldl2kkpg@4tge74omjzrr>
References: <CAA8EJpp-ZR_DN6Ue5jOQnY521Y+AfaszZYtNruPuamhZY8BAgw@mail.gmail.com>
	<20240923.015540.877935229136315744.fujita.tomonori@gmail.com>
	<dgdqakvmsezdusggiv3c53a3m64nwe2ybhgfv2dm5pldl2kkpg@4tge74omjzrr>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 23 Sep 2024 06:40:10 +0300
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

>> >> >> +Driver: qt2025 - Applied Micro Circuits Corporation QT2025 Ethernet Phy
>> >> >> +File: qt2025-2.0.3.3.fw
>> >> >> +Version: 2.0.3.3
>> >> >> +
>> >> >> +Licence: GPLv2.
>> >> >
>> >> > If it is GPLv2, where is the source code?
>> >>
>> >> For example, the driver is available at Edimax site:
>> > 
>> > Where is the source code for the firmware itself? (or quoting GPL v2
>> > "preferred form of the work for making modifications to it").
>> 
>> It's included in the distributed file. Someone extracted the file and
>> uploaeded. To save you the trouble, here are the links:
>> 
>> - the firmware
>> https://github.com/acooks/tn40xx-driver/blob/vendor-drop/v0.3.6.15/QT2025_phy.h
>> - the PHY driver
>> https://github.com/acooks/tn40xx-driver/blob/vendor-drop/v0.3.6.15/QT2025_phy.c
>> 
>> Am I understanding your question correctly?
> 
> Not quite. You are stating that the firmware is also covered by the
> GPLv2. As such we have to provide source code for the firmware blob. In
> other words, the "preferred form for making modifications" to the
> firmware file, not just the C source file containing the embedded
> binary.

Ah, understood. It's impossible to get source code for the firmware
blob. What's an appropriate licence for this case?

Redistributable or Unknown?
