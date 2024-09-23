Return-Path: <SRS0=IXWz=QV=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197E7CF9C5B
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Sep 2024 03:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DCE46C4CECD; Mon, 23 Sep 2024 03:40:16 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BFE42C4CEC7
	for <linux-firmware@kernel.org>; Mon, 23 Sep 2024 03:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BFE42C4CEC7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5367ae52a01so4490745e87.3
        for <linux-firmware@kernel.org>; Sun, 22 Sep 2024 20:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727062814; x=1727667614; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JYzJyZ1dOa0sAM3DLrqN94U2Q92SxyG+1QzizTKf0Cc=;
        b=F1Z96T3XEjFKKndRbqtcIiXaw7G6K7DALTti79d6i05aBA1jHKJALD73JTcCkIxpgv
         S3lCaxR9SgaOjPPjrQjiP0ZrGrWO/1hb4hRQIswGDveiRbh6lTabpCWZmJaOCgUgfwN8
         juWPoQGivLRzOjwtMJRZ4N1/jegsAqMGzcOdpp5c19S/LmRGX5K39ndK9+sprmx0/dBk
         pVuUWtgpE4GQNKZgqXiIeKFSdk0hsn3ytB02vAowOSeUthxlkXuEb3NzQ3wG/g9ZRHSX
         qca3+UegEDBLSwZL6I62IkVGuf8xEQy+nrvP5W4/b5iITp2vudHeX9qpMzp4iMfG0BGN
         M+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727062814; x=1727667614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYzJyZ1dOa0sAM3DLrqN94U2Q92SxyG+1QzizTKf0Cc=;
        b=ICHPxdwJ4Qy9VdWhnuh3NvUyg8zsOwfN7Xf8BOFJ/DqrXaNK2lUSAX0WnlQFTAMPzX
         kKDhSiCQPQ3ES24RNe1CnmJ14oB6o1XJQSZu9xJqg27ujZq/aTxClOBH5kBMkmWR5iSR
         S3RdbMcWpDHiyQ5CE7yd/5vS4K4hfBDoSvqw8AwzJz9Tyk1MUc4HrH4keFjtQK1jXvdT
         dnEik1eodIZEt3F1bJ4CybUWfo+TeSjb7DD8816jS2RdwAZQAVMyOwTKkGVy1Nmoyd5M
         skuwq9ojp8djkYiJGz/TbGe9irWZH3KGyoOh47c5ZSFcwxQQi4xF5437CoW3bf28Ga2D
         a0ww==
X-Gm-Message-State: AOJu0Yy+uustUt3e9V4y7N35QUKOhqAn1WDniQEGTR0VWHrk1t9OJMrU
	xaUBOncoAgPHQ500MVpFuotgkjcE+Y1JBsxl38D9ChK1mmACCplYZWsxouSEWSpt2VfgJrk36gX
	0rrc=
X-Google-Smtp-Source: AGHT+IH1Irquk17n5orAVnrBV5/vFhOVgBFb0yojz7UEThS+nar/G30A+ppEXmikyloAtAjti08ayg==
X-Received: by 2002:a05:6512:1253:b0:530:aeea:27e1 with SMTP id 2adb3069b0e04-536ac3410b1mr4813658e87.50.1727062813348;
        Sun, 22 Sep 2024 20:40:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870b42d8sm3169507e87.263.2024.09.22.20.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 20:40:11 -0700 (PDT)
Date: Mon, 23 Sep 2024 06:40:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: [PATCH] Add AMCC QT2025 Ethernet Phy firmware
Message-ID: <dgdqakvmsezdusggiv3c53a3m64nwe2ybhgfv2dm5pldl2kkpg@4tge74omjzrr>
References: <7xoyvgxj3rs6msm6yb4usnilnvbpgbgnzkc6wy4z6lg77fuklk@nfuybhnmfybi>
 <20240922.144811.2042208012316465619.fujita.tomonori@gmail.com>
 <CAA8EJpp-ZR_DN6Ue5jOQnY521Y+AfaszZYtNruPuamhZY8BAgw@mail.gmail.com>
 <20240923.015540.877935229136315744.fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923.015540.877935229136315744.fujita.tomonori@gmail.com>

On Mon, Sep 23, 2024 at 01:55:40AM GMT, FUJITA Tomonori wrote:
> On Sun, 22 Sep 2024 16:51:04 +0200
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> >> >> +Driver: qt2025 - Applied Micro Circuits Corporation QT2025 Ethernet Phy
> >> >> +File: qt2025-2.0.3.3.fw
> >> >> +Version: 2.0.3.3
> >> >> +
> >> >> +Licence: GPLv2.
> >> >
> >> > If it is GPLv2, where is the source code?
> >>
> >> For example, the driver is available at Edimax site:
> > 
> > Where is the source code for the firmware itself? (or quoting GPL v2
> > "preferred form of the work for making modifications to it").
> 
> It's included in the distributed file. Someone extracted the file and
> uploaeded. To save you the trouble, here are the links:
> 
> - the firmware
> https://github.com/acooks/tn40xx-driver/blob/vendor-drop/v0.3.6.15/QT2025_phy.h
> - the PHY driver
> https://github.com/acooks/tn40xx-driver/blob/vendor-drop/v0.3.6.15/QT2025_phy.c
> 
> Am I understanding your question correctly?

Not quite. You are stating that the firmware is also covered by the
GPLv2. As such we have to provide source code for the firmware blob. In
other words, the "preferred form for making modifications" to the
firmware file, not just the C source file containing the embedded
binary.

-- 
With best wishes
Dmitry
