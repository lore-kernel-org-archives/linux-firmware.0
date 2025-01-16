Return-Path: <SRS0=dv1W=UI=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57862C02185
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Jan 2025 01:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2BC33C4CEE4; Thu, 16 Jan 2025 01:29:40 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A104C4CED1
	for <linux-firmware@kernel.org>; Thu, 16 Jan 2025 01:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0A104C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54025432becso521855e87.1
        for <linux-firmware@kernel.org>; Wed, 15 Jan 2025 17:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736990977; x=1737595777; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K9T7mV2vVb98CXuz1Onh9zlMAsvGv9rLwOLXA+rehiw=;
        b=RR6eANZZ/WCFoGifBgBfuBNaj6UPYbw9ahuui3WTOBjZtlJ5LAl5oBPXvMxFHVqmYk
         HEBqLlYPehV/+d97Q2W/m2HFmylAmuJFob3Yw0okpSFxe/EAm7DOq+C+AH9uNqHAfp5+
         aeNLkr/MfhgQ+Y8OTTQ7lHV649BlxYNqKXJEH49ql1+VCyfkWaRsnsudla5faOxI5zaD
         v+wW7yDLAjaqrxWpxTwlA6PfaO8mvbFoqYV6WY7Veq+6BbGX/xJ97FBJuf4YNRRMf7Zt
         elQAXzqMzmDn4/LH1iYgoh5w3lCjKiLFlScw8yee2pzpN1ogyX3JAjdO1UwcjIe6dbKv
         /y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736990977; x=1737595777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9T7mV2vVb98CXuz1Onh9zlMAsvGv9rLwOLXA+rehiw=;
        b=pLzEun8Ufyzk+85p9pKHv41YKn5iBL66uTHlh6Ckue7pSLsP0HGgSEkYJvyS+ujytK
         94VfBOkr3GrJIc7e/x3J2cIYgvafAwZqOS4trkGW8Dm00E0PZqs3elGGSFyzfZXVHvEJ
         zGOnJpHqUvYKJU1LhYe1QxiSSjrOuDrtD7VrelVlAShpNkcvZIp8f9YtIwqgmCkqq1CV
         hUPu71friYwgM3w66IS8Mx/2UEpWkN/KMVscYLv2v/3GAqVx2baItsBZqxH7N6u2mOP6
         +FuE6G/esZzWNB5RrdD15IY3eF+aFgdznwyjpkkNpESpC3vNnzCqceWgNaiCgaf412LZ
         nLGg==
X-Forwarded-Encrypted: i=1; AJvYcCXuKHQ6qtNRjEMcYKj2K28M+a1rSpIqwSCSRcFEBXjQII1t0l9pUXitoDH847I1SN4O521IOizWzUUpFqNMJA==@kernel.org
X-Gm-Message-State: AOJu0YwbsaR4WsIvtEcxEaYcN+sbmW5EAmQZbXJfvZIxx6sPrWYuhYkh
	sikqBqvipz9FNrkam+SHxdanlEW+gRRM1eH52u320pPeyfMotsKh9E01HT8dYBT5lF5lCTRJxlS
	q
X-Gm-Gg: ASbGncsXfM6kffOsmV4oyUzUtfbmNA5pkFvBLgNOFx9PJXLEcX8EbGm4WsyCC+VorxD
	KLEvZdW/wr6/ZKzBx2DcrkdOsaRHm/aXnVQLge/wFgBonoiqjB4wiSXatQ38+43Nvmba/qih8tB
	kZ3uIm6BKgSN5pdAL1W/XnlSBoyWckz/Cf129Wp1Vk+0D3fE3Bp2oFhJAwd+ReK2JI0VAj90jpU
	t4+WUrVkaB6nS/KuY35XobkS9W/tj15rFkUkXmhbBJhJpC7PDaD7okHS0IyBe6WpmJo8e3+vVui
	n4p39grJBHVvqZAekuDYJumOpzku+V0isNup
X-Google-Smtp-Source: AGHT+IGsmCxUgdgnESZu8E5KV1JTbrVec2d1tbzdcd1alvinIyQzFkmE7CReevwd/sdV8PB3Tna87w==
X-Received: by 2002:a05:6512:1282:b0:540:1fec:f321 with SMTP id 2adb3069b0e04-542845b0a50mr10430769e87.41.1736990977304;
        Wed, 15 Jan 2025 17:29:37 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec06fcsm2194284e87.195.2025.01.15.17.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 17:29:36 -0800 (PST)
Date: Thu, 16 Jan 2025 03:29:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ajay.Kathat@microchip.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: marex@denx.de, linux-firmware@kernel.org, 
	linux-wireless@vger.kernel.org, kvalo@kernel.org, alexis.lothore@bootlin.com, 
	Sripad.Balwadgi@microchip.com
Subject: Re: [PATCH] linux-firmware: wilc3000: add firmware for WILC3000 WiFi
 device
Message-ID: <snk2vtgflkb5bu2pbuke7hoxpmjy23hspn2pktzplmr3ipnhgg@pz6n4eabguct>
References: <20250115171751.7308-1-ajay.kathat@microchip.com>
 <b558af8a-a72b-4568-8ed7-5be22105a5c6@denx.de>
 <798971cb-0c4c-4e5c-9e90-2488edca49a7@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <798971cb-0c4c-4e5c-9e90-2488edca49a7@microchip.com>

On Wed, Jan 15, 2025 at 09:19:45PM +0000, Ajay.Kathat@microchip.com wrote:
> On 1/15/25 12:02, Marek Vasut wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know
> > the content is safe
> > 
> > On 1/15/25 6:18 PM, Ajay.Kathat@microchip.com wrote:
> >> This commit adds WLAN firmware for wilc3000 which is supported in
> >> mainline
> >> Linux with commit [1].
> >>
> >> FW version: 16.1.2
> > https://github.com/linux4wilc/firmware.git
> > 
> > containers firmware v16.3 , why add this old firmware v16.1 here ?
> 
> wilc1000 and wilc3000 follow the same version numbering. Since, wilc3000
> firmware is getting added for the first time, I thought to include the
> corresponding wilc3000 firmware version,which is v16.1.2, in this commit.

Please use separate Version: fields for all the firmware rather than
havign misleading and incorrect specification.

While we are at it, do the old ap/p2p/normal firmware also have 16.0
version? If not, the Version clause is incorrect anyway (there should be
an empty line before the unified firmware entry).
Granted that support for non-unified firmware has been dropped in 2016,
maybe it's time to drop these files from linux-firmware too?

> Going forward, both these firmware will be upgraded with a single patch.
> Once this patch is applied, I will submit a patch to upgrade both
> wilc1000 and wilc3000 firmware to v16.3.

Just my 2c, but I don't think that this patch should be applied in its
current form.

-- 
With best wishes
Dmitry
