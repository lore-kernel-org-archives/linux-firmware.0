Return-Path: <SRS0=JQRr=VZ=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953EAC282D1
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Mar 2025 05:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55D9EC4CEE4; Thu,  6 Mar 2025 05:10:41 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD5CAC4CEE5
	for <linux-firmware@kernel.org>; Thu,  6 Mar 2025 05:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BD5CAC4CEE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-543d8badc30so305006e87.0
        for <linux-firmware@kernel.org>; Wed, 05 Mar 2025 21:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741237838; x=1741842638; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ia0Zx2JsWBPOjuqkc06DaMYPIPQHviJm2kXnLUhYWo=;
        b=mr14JG0ych3Wux6NTEUEyLXjMtcaaUw8/Z1cxXTsJz6LPzQ0BPBa4k+7RSpOLzKByb
         zxsjnq6PVQ+yCrStjxIk4JigCw0R+9AHnk2Ab2fwEvqiBSMg5AXGTjEyuFKikS7/aPaq
         C1cFDhYBO+As2HOSnoKWAR2s+IUQWGsavMWhb7dvlXSi0vPLbZMFNXwQipIYgCKK9iEZ
         I9yfxv3+1C5ARl5AGyxANlKykQtW6XaHmeNMJD3wvRBOalrXKkak/25Nw+ghs4VfP5aX
         1gXWJs88WkTjz/R+26aYKhb3Ca3RE2M+YmJUKN7vRSLscaxSsLADh1MKfjae9E1kZGG5
         +Odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741237838; x=1741842638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ia0Zx2JsWBPOjuqkc06DaMYPIPQHviJm2kXnLUhYWo=;
        b=TcrEqLT15z4wvJi+Ho9Hzxqn4VQFVGqUhlsA7OPSoJh6H3shN7/AFGjup6oUGK7hP9
         qXDUa5rTm/zEFPsRDlHfHxDX2um12evcJGG1zuKR65x43gooJwXM5NWgklZ5lbEidOYx
         J4ooA5YeiUCdP9MnLV/PakxTUifBxdNVTfIXU+sQlH8GUoRR3BYspZsg2DsU2Eyez5tZ
         dqnZxgbT0cdgZs5XXFtRCFhh52vCem88kXeUrcWUpSZJBVCgQ74KgWfXsoiAYWx3g1WN
         MWVHT1y5CqmEDiHXY+hgIc9cRAIgpy/oF8DzDpHxu6yWJYkvoALXROkhpPSVkWj3r5dT
         SOlw==
X-Gm-Message-State: AOJu0Ywfpnf0BjMMsKKWeWYk2z5od+d4mpENnXZgMF3e5I/l8TUx1Hkh
	phhfgTE3KHHQM0l25L1cL0djJW9DcIbghGQemJRgr4yD4bvRQ3B/YffIPhklQ4o=
X-Gm-Gg: ASbGncvdDrLVGnz97wpf26ms/DewIZX2DOdSptu0mjvMXPElwdgjAjgtjVaiZis/t5U
	+hny5WMJJd+9v47WyixKv3NyOL7YeynKaTtx92sVBq9ozarCVeuSsTF4nNWrIaaYuFMSW8eVnRT
	V2grKRIKMoUbPlXNAhyV1XedQDWh3QZN35QxgjgbeDDJTiz00d99lmgvX6K/yYTXZGef4y7eyN5
	vko4qUo6FpSD01b4u3sz7v18SZ+Y4fMzosuOIqcRTxTBCx632dMmnhoYLBLz6mo2ou3+aIwE3df
	00i96hgfM4YnfogrmfkT38H0qKONYNSg9PQQ0eK2rtXsEklE/c3eR5RTC3G3G27s4B5yabk9Art
	BPcEaC7IXDSYohUhV9oZzpwmB
X-Google-Smtp-Source: AGHT+IHPfjJ5EiU7X826aqg/LBolEfLHvrJjYAOxq8lRHt0nuGkGg2CWEflOGKglQgFxC4frM4QqSg==
X-Received: by 2002:a05:6512:b90:b0:545:5bd:bf42 with SMTP id 2adb3069b0e04-5497d37aa64mr2309351e87.36.1741237837402;
        Wed, 05 Mar 2025 21:10:37 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b1c468dsm61213e87.258.2025.03.05.21.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 21:10:36 -0800 (PST)
Date: Thu, 6 Mar 2025 07:10:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Zijun Hu <quic_zijuhu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Subject: Re: [GIT PULL v2] QCA: Add and update Bluetooth firmwares for
 WCN685x and QCA2066
Message-ID: <2t5btpic6wgehpaww2oahr2ngtsyu62mvacfc5726u4kz4s42a@ti4hj2shd6lt>
References: <2085b56d-318b-439f-832f-a31113dd07f5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2085b56d-318b-439f-832f-a31113dd07f5@quicinc.com>

On Thu, Mar 06, 2025 at 11:31:16AM +0800, Zijun Hu wrote:
> Hi linux-firmware maintainers
> 
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
> 
> The following changes since commit 41a528251649772edbcb705a40e617fd14858e53:
> 
>   Merge branch 'intel/guc_70402' into 'main' (2025-03-04 19:09:49 +0000)
> 
> are available in the git repository at:
> 
>   https://github.com/zijun-hu/qca_btfw qca_btfw_0305-1
> 
> for you to fetch changes up to b011c42ad704a6fe03c38793972e9b48057ed1aa:
> 
>   QCA: Add Bluetooth firmwares for QCA2066 with USB transport
> (2025-03-06 11:15:39 +0800)

Version: tag should come before the relevant File: tags. Could you
please fix the order of fields in the WHENCE file?

> 
> ----------------------------------------------------------------
> Zijun Hu (4):
>       QCA: Update Bluetooth WCN685x 2.1 firmware to 2.1.0-00653
>       QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00653
>       QCA: Add two bluetooth firmware nvm files for QCA2066
>       QCA: Add Bluetooth firmwares for QCA2066 with USB transport
> 

-- 
With best wishes
Dmitry
