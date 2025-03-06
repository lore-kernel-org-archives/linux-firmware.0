Return-Path: <SRS0=JQRr=VZ=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E238CC282D1
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Mar 2025 07:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AFE6FC4CEE8; Thu,  6 Mar 2025 07:18:41 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A2A92C4CEE4
	for <linux-firmware@kernel.org>; Thu,  6 Mar 2025 07:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A2A92C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e608b2698fcso210697276.1
        for <linux-firmware@kernel.org>; Wed, 05 Mar 2025 23:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741245519; x=1741850319; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TNrz/tz1c2dec/y6DphdXf1M2T9D/p+vyBiaaOgdiHI=;
        b=uF0RGIFxF502q6Ru3y7OdvCKem4J+l2HoVf1NmgEFyi6idmistfyaOHkuotwZ5dMpW
         gdvVbARf2sDyjqKj41JcdzEkgxlpyq1RPe6w84pfssIfJ1CSpgqxNpIUqAI67A8tUq1v
         I75a/OyS9yZAMyLsWEN8MDedj7Uz2LZr1y/3VIS2mDTshcYxTGR2w+xHVhXe1NjGQwX9
         +bNK82H0ijtsmqXk69D9TxNAE/CQvrtJmYSU3QJErwxYPY0G48cV6dSmMRlZq1TN4H6l
         sJ5gKl+ntuvutkeReT6ebJ2cxEOt3d5eLjShTP+MVKfL+GsrJDmS2p3FQmK8O8lzv/R3
         TJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741245519; x=1741850319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNrz/tz1c2dec/y6DphdXf1M2T9D/p+vyBiaaOgdiHI=;
        b=hFpvgTeZdFhprWHw7khaiYD48Xhhe7ew8zFzGMUPt+5sYJnW0bgQEvXjUERr0NWV5L
         YZov/TCBfw7Nd8NvXCI13QUQxZfXZ/6EpUFIwQG9hpAZz75SW+PL4kXhwb2bB+ShY9V8
         CzdOQGUH4toGD3IHsqlQobc3GfnXpTQAiq5LBhirs3K2CIPm7XF23DzXwICeJACK46VJ
         cWi/L1F5ITtFFIbZVRnZJTn25WeS4G80SCWFA7DXv50e3oczgkPrnleo17O8HRUAwaeZ
         b4PcJu085V1Pm5gz/n2PGVhJQlMu0hy/kqSbDA9cxbbQoZkUBaxUtykaXw/vf7ZUIuwg
         ivJw==
X-Gm-Message-State: AOJu0YyNNn97xDG6fu9TTBrt/zOrbyqJ8m6b1158BAc5ILClS//GuAwh
	+wfo3hE3SBrcbEFYkJ9KoYwx6MpY467aOh7FLUZ8LZkYlJpVo2NZIjRFETmygprLaklet321F8R
	5V39oSAEY8aGP1WZHVvrvcbHNdvSY7RUrChvIjg==
X-Gm-Gg: ASbGnctFvFgTjBD7LozNPMSKjex1WRwStAMmvX6Gfxz2EmkJCILw1xHhOJ+q0lD0GR6
	OSFti5h3XtGgyPIeuQDveCxDSqmujZBmsHTEpb4SOir2tkyrtyGyzBARpzpfI9FslEJ/5EMWF9V
	baeU0wp7bM3U5L2eNimchToGa7
X-Google-Smtp-Source: AGHT+IGLz87E0QBC4XXmt6ORFTflpgwTtroRRz2yF2Ct7AodI8lpsUoypvzeIeLiQIessVB7vbXIXrp/byfYb4mqH3k=
X-Received: by 2002:a05:6902:188b:b0:e5d:b88e:4f07 with SMTP id
 3f1490d57ef6-e611e1ccd2emr7900973276.21.1741245519465; Wed, 05 Mar 2025
 23:18:39 -0800 (PST)
MIME-Version: 1.0
References: <2085b56d-318b-439f-832f-a31113dd07f5@quicinc.com>
 <2t5btpic6wgehpaww2oahr2ngtsyu62mvacfc5726u4kz4s42a@ti4hj2shd6lt>
 <83952440-70ce-4dfd-9991-bfb8b37683e0@quicinc.com> <jdhvuzryhd5ut4gzjv4s526gehbkjjvv573d45rhbosrcayf5e@nk34n5sb6xgu>
 <770a29f7-74df-4233-b3b4-8c83e910cc90@quicinc.com>
In-Reply-To: <770a29f7-74df-4233-b3b4-8c83e910cc90@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Mar 2025 08:18:27 +0100
X-Gm-Features: AQ5f1JqBrZiSobad72HWL2TkLnAtRITIBTQLT28Ql7MlIWF3weXZ9HaC8Zya5s4
Message-ID: <CAA8EJppH2z6m7gOdS6dCy-8_-Qjo7j=A5q-PC3hL9ZYQ2f6itA@mail.gmail.com>
Subject: Re: [GIT PULL v2] QCA: Add and update Bluetooth firmwares for WCN685x
 and QCA2066
To: Zijun Hu <quic_zijuhu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Mar 2025 at 08:17, Zijun Hu <quic_zijuhu@quicinc.com> wrote:
>
> On 3/6/2025 2:42 PM, Dmitry Baryshkov wrote:
> >> Are there any formal link or Docs about which one is better or have
> >> description about file and version?
> > Most of the entries use the option A
> >
> >>> please fix the order of fields in the WHENCE file?
> >> that may be another topic, may need a dedicated thread and patch to fix it.
> > I meant, in your patches, of course.
>
> Change
> +Version: BTFW.HSP.2.1.0-00653-VER_PATCHZ-3
> +File: qca/CE/rampatch_usb_00130201.bin
> +File: qca/CE/nvm_usb_00130201_030a.bin
> +File: qca/CE/nvm_usb_00130201_gf_030a.bin
>
> To
> +File: qca/CE/rampatch_usb_00130201.bin
> +Version: BTFW.HSP.2.1.0-00653-VER_PATCHZ-3
> +File: qca/CE/nvm_usb_00130201_030a.bin
> +File: qca/CE/nvm_usb_00130201_gf_030a.bin
>
>
> Right ?

Yes, thank you!

-- 
With best wishes
Dmitry
