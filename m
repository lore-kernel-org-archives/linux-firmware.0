Return-Path: <SRS0=aqJY=QU=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47226CF9C6C
	for <linux-firmware@archiver.kernel.org>; Sun, 22 Sep 2024 14:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 150CFC4CEC5; Sun, 22 Sep 2024 14:51:17 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2DC66C4CEC3
	for <linux-firmware@kernel.org>; Sun, 22 Sep 2024 14:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2DC66C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e129c01b04so618127b3.1
        for <linux-firmware@kernel.org>; Sun, 22 Sep 2024 07:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727016675; x=1727621475; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PnEMlLNo5x32HzBqZ9D1HKiVZHc890/jxU1byUSBouI=;
        b=TTtJ/EsWe7T5wQNbeJcsUhM5wuTstK4lqtCCvn8CjH9ysonXOv+j2TBmCQlEXbfc9F
         VVVFvUvV52pZ1a2Nhk2J9ao+DU8w+ErO+u4iX6fT8Y3N+qgLJLiANXJQN2R+7NS4fqJN
         2GtR8th8vbdgabDP0q5RbqiTIJQ4WbmBa8UBQG2/YGQQgCPvTgcGGk7ZfSxUxB0P8NE+
         D2xukivHq2uDLPwYxCzV7QgS6IPobQo11MH5Ae/J8Qj9BEl5KPEn1hKLBAIb02maY6/z
         wTRPj3l/XtFskEnSbj3uT+Pj5VCq1TQoNi0lqc3jE7ln35Fa8PmO15FqQ4JvZWERfCFW
         sbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727016675; x=1727621475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnEMlLNo5x32HzBqZ9D1HKiVZHc890/jxU1byUSBouI=;
        b=BB4ot/tPT8pOPqm926Ys92CN5TqnbWcVw6e9m1kQXBoY++TNRZwRmZQBHnAFz5/PpA
         rLrEviuKCbEhYoY0IHZ4yhBZ/95u7qyQak2BP7CfUelFQDeAEUZRqJILos1ZnFlsacNd
         KZ8yyBOxqqrCT7/4GwGmfQIhUDqG1FJUCVMiw1UpiYByw7P88V2BgX0pSum896P18htG
         zxtoPtt83jTqMmrpcuSWQbbDRaLu0DpvSWzuMg11BuKqmABmpAc2ayDFsKViTDZslOFy
         se08leS65/9A6cv8WEdI1/0rzZMSHmYQuxu+2//emqTHj54LyQigzbLR7DO3vRW6jNkG
         ms9A==
X-Gm-Message-State: AOJu0YxKCGQAK3H9lPA81OpGKfl8kdvN9xNvcpK3sGrpaC1Xk96dg8Xn
	YSy34QyXqgk734VzuXr9F/WR6t5co75Uo1LdsEYzgKWW4pgvXiDPabUFNFqdxTMy5k880/Eqo+K
	91HK0d1f6dlnquVOAUOHhQ8RXfr/YwaxyXvAiTOUgjItmXJhAMs8=
X-Google-Smtp-Source: AGHT+IFc5G5MLKEaHwxspuauVEPZGBobh/EFFv6VgxHvY4XNPxH6oF6qYZqqLW2QrRN3cTI6VNOnqAgk4YWLhpnZY4Q=
X-Received: by 2002:a05:690c:7288:b0:6db:e55a:1c88 with SMTP id
 00721157ae682-6dfeed61ac8mr70568987b3.23.1727016675044; Sun, 22 Sep 2024
 07:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240922102024.218191-1-fujita.tomonori@gmail.com>
 <7xoyvgxj3rs6msm6yb4usnilnvbpgbgnzkc6wy4z6lg77fuklk@nfuybhnmfybi> <20240922.144811.2042208012316465619.fujita.tomonori@gmail.com>
In-Reply-To: <20240922.144811.2042208012316465619.fujita.tomonori@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Sep 2024 16:51:04 +0200
Message-ID: <CAA8EJpp-ZR_DN6Ue5jOQnY521Y+AfaszZYtNruPuamhZY8BAgw@mail.gmail.com>
Subject: Re: [PATCH] Add AMCC QT2025 Ethernet Phy firmware
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Sept 2024 at 16:48, FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Hi,
>
> On Sun, 22 Sep 2024 17:35:23 +0300
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>
> >> +Driver: qt2025 - Applied Micro Circuits Corporation QT2025 Ethernet Phy
> >> +File: qt2025-2.0.3.3.fw
> >> +Version: 2.0.3.3
> >> +
> >> +Licence: GPLv2.
> >
> > If it is GPLv2, where is the source code?
>
> For example, the driver is available at Edimax site:

Where is the source code for the firmware itself? (or quoting GPL v2
"preferred form of the work for making modifications to it").

>
> https://www.edimax.com/edimax/download/download/data/edimax/global/download/smb_network_adapters_pci_card/en-9320sfp_plus
>
> Tehuti Networks went out of bushiness but some vendors still sell
> products using Tehuti's TN40xx chips and distribute the source code of
> the driver.



-- 
With best wishes
Dmitry
