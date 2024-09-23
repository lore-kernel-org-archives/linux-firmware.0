Return-Path: <SRS0=IXWz=QV=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1706DCF9C6F
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Sep 2024 10:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E5014C4CECE; Mon, 23 Sep 2024 10:02:07 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F3CA8C4CEC5
	for <linux-firmware@kernel.org>; Mon, 23 Sep 2024 10:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F3CA8C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5365aa568ceso4651018e87.0
        for <linux-firmware@kernel.org>; Mon, 23 Sep 2024 03:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727085725; x=1727690525; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nP21ZG+CkJFoCvRHPAVQDZvBmT/CRCpD22jP2j750Kg=;
        b=EDxlrqno/mxR9bSFrVWkRD1S+QYV9Lacxyb65r0NVbM+I5u2zVLlMdUn65/99NUdkR
         Jm+Hz2tsxapKUIXp0TokwvreNZ0fl6ZeOiMczqQmhfLRjzwXNwbkGqnzZNpzV7BNmhkM
         QHIvx2hmxMzqHcSGoy9uHQK8HfQPHQywbo8NbkeD1pNqD0JkSt3DOb4XsP8xaV/hKH65
         0BD8GGrFkYAUskcfV7fI9UR69VTDZs64Jcnym8iSDJViIHFt/r8TwLmjEM8z6bXaic8a
         kz7FOkLdSJsInio6Ed7Yg4qF9FXCXyUvw3BGUKtE1PfEJKk/hycseQIbYdH8BPmtP2Kg
         5TiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727085725; x=1727690525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nP21ZG+CkJFoCvRHPAVQDZvBmT/CRCpD22jP2j750Kg=;
        b=MyEziByACDv8xhq0SaW1kl0FpaFHO2JPv9plqN3tnXW1A3MHl+1bWIhh1nYfDp5D4R
         zskucvb/RmbFwHzP3B2eps7Ox6D4sHWjKPpFh0z3ES4PI1Dwek+epxRLKVkxrNrr6Mf6
         XfhRwBKpfGcKmq6aRScKuGBpoHzfGTgtUSuJfBorsbnd7xWZfypTDAEmh/Vzk/bXOJwX
         hxkBRSSGj8HWBkcRktG1GZx8okpTWw3QJsIJ+jyEmTkUQbHxCoHT3/SjWvx4JSTD5LkB
         9aGQpCNnx/uZ9FtZnpWYhdN8BZdfoEIM9IvrEdC/aAStBss2Ta5ZfOp5T4FuqYDKrq4a
         r2jQ==
X-Gm-Message-State: AOJu0YwYpLeo2ELRz2DVMranvg0VoVTpOSevY4uB/qP1Yyi8KqF2wbp2
	/4XAHXDcXoCghb3KD+hpziRLPM4XOXWAx2m83H0m8dF7O0jiHE/FcUMMDRwETs9XjyP9jclzirl
	g+dmQaA==
X-Google-Smtp-Source: AGHT+IELuwXzS2aUOpd002Nut/1r/fnySKeJ9BSFvkWLbQX3TjQCdZ5vUFTDLjeRRacSgKq4mYdB/A==
X-Received: by 2002:a05:6512:12cc:b0:536:542e:ce1f with SMTP id 2adb3069b0e04-536ac2e6fb1mr7913335e87.18.1727085724963;
        Mon, 23 Sep 2024 03:02:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870ad17dsm3247883e87.241.2024.09.23.03.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 03:02:04 -0700 (PDT)
Date: Mon, 23 Sep 2024 13:02:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: [PATCH] Add AMCC QT2025 Ethernet Phy firmware
Message-ID: <tb5ykgcjrvowen2w7wklq46ypibmlzi4l3whdzxwrecelbzyw5@cw45aljcai24>
References: <CAA8EJpp-ZR_DN6Ue5jOQnY521Y+AfaszZYtNruPuamhZY8BAgw@mail.gmail.com>
 <20240923.015540.877935229136315744.fujita.tomonori@gmail.com>
 <dgdqakvmsezdusggiv3c53a3m64nwe2ybhgfv2dm5pldl2kkpg@4tge74omjzrr>
 <20240923.050651.1829650131953275090.fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923.050651.1829650131953275090.fujita.tomonori@gmail.com>

On Mon, Sep 23, 2024 at 05:06:51AM GMT, FUJITA Tomonori wrote:
> On Mon, 23 Sep 2024 06:40:10 +0300
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> >> >> >> +Driver: qt2025 - Applied Micro Circuits Corporation QT2025 Ethernet Phy
> >> >> >> +File: qt2025-2.0.3.3.fw
> >> >> >> +Version: 2.0.3.3
> >> >> >> +
> >> >> >> +Licence: GPLv2.
> >> >> >
> >> >> > If it is GPLv2, where is the source code?
> >> >>
> >> >> For example, the driver is available at Edimax site:
> >> > 
> >> > Where is the source code for the firmware itself? (or quoting GPL v2
> >> > "preferred form of the work for making modifications to it").
> >> 
> >> It's included in the distributed file. Someone extracted the file and
> >> uploaeded. To save you the trouble, here are the links:
> >> 
> >> - the firmware
> >> https://github.com/acooks/tn40xx-driver/blob/vendor-drop/v0.3.6.15/QT2025_phy.h
> >> - the PHY driver
> >> https://github.com/acooks/tn40xx-driver/blob/vendor-drop/v0.3.6.15/QT2025_phy.c
> >> 
> >> Am I understanding your question correctly?
> > 
> > Not quite. You are stating that the firmware is also covered by the
> > GPLv2. As such we have to provide source code for the firmware blob. In
> > other words, the "preferred form for making modifications" to the
> > firmware file, not just the C source file containing the embedded
> > binary.
> 
> Ah, understood. It's impossible to get source code for the firmware
> blob. What's an appropriate licence for this case?
> 
> Redistributable or Unknown?

Well, either way it might be problematic for linux-firmware. Is the
original vendor still alive? If so, you can ask them to license the
firmware under some kind of redistribution-friendly licence (BSD, MIT,
some custom text). It should allow redistribution in binary form  with
no restrictions or attachment to any kind of hardware. It can restrict
_using_ the firmware for what vendors are used to call 'applicable
hardware'.

-- 
With best wishes
Dmitry
