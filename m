Return-Path: <SRS0=ibhU=UM=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81890C02188
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Jan 2025 09:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46F23C4CEE4; Mon, 20 Jan 2025 09:34:58 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2189EC4CEDD
	for <linux-firmware@kernel.org>; Mon, 20 Jan 2025 09:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2189EC4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5439e331cceso2520345e87.1
        for <linux-firmware@kernel.org>; Mon, 20 Jan 2025 01:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737365695; x=1737970495; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3F9ojX3wZs30sHU2vgMm6TVct26BYAS2TcpCprmpcNk=;
        b=QX5xRmHmCESBthqQ3wIog/cbQ2A3IadUT+hzkF28OJMEcZL7+BTtbzTcOGWh/JdXsJ
         KZ5JGhKudjIPtYcPtyg54aI+Wcy7MV9ygL7InbeU+u4lWdnZhQhtW/61o7SffDyHlR2D
         rABmLPYO2QhQXa+G7p5dv6cKQ81dymBxt03/V8UyLIHXMIPx9HLjGN6vcBB9vgoG8HR7
         o3gRq2UqGBL1nL7umIMLM4o7F6pJ9Soibmvo0RqYc7G8JcmIW/2bTK9KxWnG1HMLdFIV
         yUy9XB/U/Uz0MYfltySkHfUttsQRRSNA7psGD/IP97I7JGu2KHbYpXy8988qhOWdxVJX
         +Yiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737365695; x=1737970495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3F9ojX3wZs30sHU2vgMm6TVct26BYAS2TcpCprmpcNk=;
        b=lFFiUAuPDacqqkqpnwiKetzmakJM6ZgE0FGZGBBQhJDC/PftjQCJd7HmGzr/OdVEIW
         Yt2flZwf1hlqwLsQNISrBx2yg4wwuwze0ORYkXWoedhU3S8LQOIAQT2anm0dvzfWH4cm
         zhxV+LHWn+e6JB6/WOamL44NbxKpEr9rm4jLckxxVkCEbFGAKZm9O0MuYnWql8RCotbD
         3R41mfpXFzrr0SUssubPntpWrjc7YgPKBTNA5xjZ/5Ym7GG9KyvCyXEain7Ceu+dApxw
         RCDYjLvK+OLlJnRCm/6yW4UUT5MFVd57mj+H8n2emNiC8XqSFXTsmAj3wg1zjxozdB21
         whvw==
X-Gm-Message-State: AOJu0YyQolbETOuG+4mgjGPNJetdLUKiUT3uXHmxMREQ8wJRtHDicKZg
	o6N+81B4Ax84AtXto1et/BymkqWoSC37USMvn1AwN5Qa5VQ5GylPeDJ+uWS7uzhWbXGx4bKWkpD
	pxxo=
X-Gm-Gg: ASbGncuSaNTZer4YgUrK/OBXy3ONnYsafXdOWBuTUmBIf0pqjK0C6OfCa723hKy4MTd
	zaSIt/bYWYBBC1teZgdQu+vUXlrPlSz/09Emj2EfM0a5ZRNFZM8yMeJT/qpLXqi4dvAz8Yu9HKd
	MZ9A/OxxxOLYUnY75wxOpWeZh2/s41ZotSpdPaNVNc612sTXZvhmlHGq2aEjjrQ0WxpieoM/YmT
	tKV8a+Tedib34W0dNTe+AK9OToTByiP8yM6yY8VO+CO6+TmwNLW2tphvY8uMPgqkLSVOMZVFO6w
	soqOhYCMWjxstinkUquAtGPXewJ8ZJ1BQqwcSTytlrFY8HTl5A==
X-Google-Smtp-Source: AGHT+IFGLBlGJZECBa8Vuz6gmVs4vbOKxOvULwtvu1POP6XqbXEO98enFeQ3JrnrrnxOzUP3D0OWAQ==
X-Received: by 2002:a05:6512:32c6:b0:540:2022:e3c6 with SMTP id 2adb3069b0e04-5439c267577mr3754626e87.35.1737365695060;
        Mon, 20 Jan 2025 01:34:55 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af60965sm1265424e87.138.2025.01.20.01.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:34:53 -0800 (PST)
Date: Mon, 20 Jan 2025 11:34:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Subject: Re: QCA: Add Bluetooth firmware for QCA6698 request-pull
Message-ID: <4zg574wtssuevuhqgaul4jsseyfycbvjyeau4h23uv5x66s7xc@2axqtbzvphub>
References: <f8324c4c-985b-4283-922d-1f0de766fde3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8324c4c-985b-4283-922d-1f0de766fde3@quicinc.com>

On Mon, Jan 20, 2025 at 05:13:17PM +0800, Cheng Jiang (IOE) wrote:
> Hi linux-firmware maintainers,
>  
> Here's a pull request for btqca bluetooth firmware. Please let me know if you have any problems.
>  
> The following changes since commit a28a9226ccb8bf393b8e7dd8970a4d967c1a1d92:
>  
>   Merge branch 'robot/pr-0-1736646402' into 'main' (Mon Jan 13 14:30:09 2025 +0000)
>  
> are available in the git repository at:
>  
>   https://github.com/che-jiang/qca_btfw
>  
> for you to fetch changes up to c07a64c0f9348b1da997c944467857d73a6fa8cb:
>  
>   QCA: Add Bluetooth firmware for QCA6698 (Mon Jan 20 16:58:47 2025 +0800)
>  
> ----------------------------------------------------------------
>  Cheng Jiang (1):
> 
>     QCA: Add Bluetooth firmware for QCA6698
> 
>     This commit will add required Bluetooth firmware files for QCA6698
>     The image version is 2.1.2-00035.

Please confirm whether these files should be using LICENSE.qcom or
LICENSE.QualcommAtheros_ath10k?

Also please include into the commit message an explanation that was
shared together with the kernel patches so that nobody is surprised by
the subdir and the firmware names.


> 
>     hpbtfw21.tlv : RAM FW dump
>     hpnv21.b206  : NVM dump
>     hpnv21.b207  : NVM dump

Which platforms are these two files for?

>     hpnv21.bin   : NVM dump
> 

-- 
With best wishes
Dmitry
