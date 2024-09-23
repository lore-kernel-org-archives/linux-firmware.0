Return-Path: <SRS0=fOYR=QV=gmail.com=fujita.tomonori@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CAACF9C6C
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Sep 2024 01:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C56AC4CEC3; Mon, 23 Sep 2024 01:55:56 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56B41C4CEC6
	for <linux-firmware@kernel.org>; Mon, 23 Sep 2024 01:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 56B41C4CEC6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-208e0a021cfso14243315ad.0
        for <linux-firmware@kernel.org>; Sun, 22 Sep 2024 18:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727056554; x=1727661354; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHSRYX992296wwwAL7A1AfvRmEGoss4dMeP/ixAmUv4=;
        b=TrU8D3N7YahcEvyKpgWt/6FOJck8yrJCUGyhVQ6Bi3ihHoZ+w7i/eVo7gh+jqor3Zd
         YT55aJmVt4PTWFX53LFBoYDOC9h2tAL/xFWW7CcgK+IZ9P3cXv2Qi0PY6jmky/UbK/A/
         E6zAMHnu2h7TieAvw8UlwzfV/oZDQU0UOiG12F2rhCd9Lc1tRcrHWKQF+la04FNFVAbM
         NdC3mCQoLDx4QbHiRoIbaJDIu4wl5jW+3LeftsF4SquUcOatbiwvfWDtqSvGvsplpWeq
         xtAvC2/X9D166DhGQTDF8UAmRV21x3RGAnTMPrpPd8VuctyNxcSP4jOAGWCYMhpr+2lq
         /6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727056554; x=1727661354;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PHSRYX992296wwwAL7A1AfvRmEGoss4dMeP/ixAmUv4=;
        b=dE8FxSXb3sVOxgGT5XZKu9Ig0tF9XdLGXqi8sAD/csd6FEvdlIJt0SixPzdB2P7MYk
         1sHk9oZYjnc6ThZepqUtkZrWFYCmLGFFnOGUYkkGZduixYMaUhmPjnpj4bKvWN+9acDV
         SG4tEaeBHamh3f9v/wgUH7B/oq3v6Ub59oNw5WVevObbvOZ2G2upwxRC8EDfmTgswD3v
         P0EX3ib6olXWSqCjexWKkHFFIiruZuk5tpqi+I65JI8aU0qeX5LQO1KK4iVamW9xfgo7
         4i6q+4ElsuXfkxeSPXrNpCkd5as1iIIcRGs4ed1lbUUmiHVlFWBlgZfa7ytbYaYagpyQ
         irHA==
X-Gm-Message-State: AOJu0Yx4W4BcOM/s7aQtDIflqJ71r0KwxKL7EaAPNSUe+PczjYSCsoll
	zUeRP9qN+7ow5IjxlcjyjZqa+jEsAXPU49+aj/GepQddalYVk0Lu
X-Google-Smtp-Source: AGHT+IFYG70wyiWtCpu3JOu4ae4pj4LW8JRxV9Ynm1+NpSD7SYnMSTlgjWNnMegVyhPCUE8QRmnnOw==
X-Received: by 2002:a17:902:e5c8:b0:202:49e:6a35 with SMTP id d9443c01a7336-208d836cb2bmr168681485ad.19.1727056554454;
        Sun, 22 Sep 2024 18:55:54 -0700 (PDT)
Received: from localhost (p4468007-ipxg23001hodogaya.kanagawa.ocn.ne.jp. [153.204.200.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207945da563sm124104395ad.60.2024.09.22.18.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 18:55:53 -0700 (PDT)
Date: Mon, 23 Sep 2024 01:55:40 +0000 (UTC)
Message-Id: <20240923.015540.877935229136315744.fujita.tomonori@gmail.com>
To: dmitry.baryshkov@linaro.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: [PATCH] Add AMCC QT2025 Ethernet Phy firmware
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CAA8EJpp-ZR_DN6Ue5jOQnY521Y+AfaszZYtNruPuamhZY8BAgw@mail.gmail.com>
References: <7xoyvgxj3rs6msm6yb4usnilnvbpgbgnzkc6wy4z6lg77fuklk@nfuybhnmfybi>
	<20240922.144811.2042208012316465619.fujita.tomonori@gmail.com>
	<CAA8EJpp-ZR_DN6Ue5jOQnY521Y+AfaszZYtNruPuamhZY8BAgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Sun, 22 Sep 2024 16:51:04 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

>> >> +Driver: qt2025 - Applied Micro Circuits Corporation QT2025 Ethernet Phy
>> >> +File: qt2025-2.0.3.3.fw
>> >> +Version: 2.0.3.3
>> >> +
>> >> +Licence: GPLv2.
>> >
>> > If it is GPLv2, where is the source code?
>>
>> For example, the driver is available at Edimax site:
> 
> Where is the source code for the firmware itself? (or quoting GPL v2
> "preferred form of the work for making modifications to it").

It's included in the distributed file. Someone extracted the file and
uploaeded. To save you the trouble, here are the links:

- the firmware
https://github.com/acooks/tn40xx-driver/blob/vendor-drop/v0.3.6.15/QT2025_phy.h
- the PHY driver
https://github.com/acooks/tn40xx-driver/blob/vendor-drop/v0.3.6.15/QT2025_phy.c

Am I understanding your question correctly?
