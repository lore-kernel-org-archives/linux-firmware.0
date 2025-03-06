Return-Path: <SRS0=JQRr=VZ=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092B7C282D1
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Mar 2025 08:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B923BC4CEE9; Thu,  6 Mar 2025 08:16:27 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B14ADC4CEE8
	for <linux-firmware@kernel.org>; Thu,  6 Mar 2025 08:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B14ADC4CEE8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54955222959so431936e87.3
        for <linux-firmware@kernel.org>; Thu, 06 Mar 2025 00:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741248984; x=1741853784; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OTF0CMKZoD+CyDRHELMPCpwXSroVOQiElTmUTkjHBhY=;
        b=J20C0hM+kXzdkOp7PfIYDrHoHa/kzFBxX2TU08W+b4edGcf/2pwVhr/j7I+xXYtFGk
         shbQGL4SRv2vuYzIn41cUU3dwmDBSCE0QyoSkOTz6/eUO+/fiDvqdXPugvfBC66qB8gi
         upZCB/Ni/sKX6xA3vAGVwf13Upm/kKKCkvzhqXFbDl5so5rdbuqvAs4LI6rTrlS4gzVZ
         hkSkbPijuitNxUNAV5fdkAwlWZiHam6qriE4M2lYfd13ZqmoWVSKDRf9higVK9vRZehm
         poD5YQUkMuSYj+qvrA2WcrTfCVbEnC5JJLGFBMxb6qUnZnjT2vnScLN3grbsYkllg8SE
         yC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741248984; x=1741853784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTF0CMKZoD+CyDRHELMPCpwXSroVOQiElTmUTkjHBhY=;
        b=ZVmril2k7a3cgvG3nRVjqj90io97UKPCGGsBn7fA28oi+IIUSYZOxIX8WP6S1czhDI
         7g3aEmMh8WBd/4R195ok7O1D4cctaecTk5lBorkxhPyus6i17FoxHBLfpdN/xYlGyrhX
         CpnpVNq3R6VdbeBKOXFuVPw5qF96/M6gUzbbtfJZX7GHRwxCUxNgdKH0AwBd9HNEy+uX
         q38oDlDRgjB3oR8FneK/hDB/PsyqWF7daDC2YBJF0alu2OqtuGQMqZOYctaQUq3LzH4C
         OW9UC+zMfdo9jd50RpNArAoY5KgFf66SWD17GQX4PPKo79wURXuNL0YsXDk23e8kOiXV
         651A==
X-Gm-Message-State: AOJu0Yz0AnUTup/WTQyIkZrOBLOLln/aIccj0FPiUbjRxa5UWkrmWb9J
	aFeN5pKUyiiJEuyDtJqUz1LJANQ6YlHecBGzcapNB2uZPqvpb7w3jgCqoEN1Kis=
X-Gm-Gg: ASbGncvMXywigQPxiqnGYJTHqf1kMkFIPqBIRad9kr/EuP6s0eOZ9W6CEgLOIAM+zn8
	8ISW7GJ4WPUR7ApITiavy0L9TlZL3Wvzb3zduY7LrTlPZly60pZa9Axqt4Z3GiOH12BlareEzuj
	xGBpcQZNLJ5v4sWHNvINEyqP1p8a6f0bX0EYxPC7De7i5/0kJWJoSp1gYOaVSGcbKfEJpXPtpnZ
	0xQevDh85bdBb3Xf9QDvY6gw505SZOqW620DIsgwtaG2Hnv8hRKh+NK7pTse/R63gnaOOP9f1gM
	BvpYJTJ/GRRDhbDxslS+D80Ojt8UioTDJ8HhH1JzwwiJfTkbdsgQXayQeeFtR44AaIqgA2bymL9
	OtZ/zUlFsnct4QoebJBx9ShLA
X-Google-Smtp-Source: AGHT+IHRhV5iQXrMfx1tkNx6TrqVhSsQTMPtrVqssOMYVpihjDhySPe9/JKOnd9+8iIcGDg8CexTwA==
X-Received: by 2002:a05:6512:3094:b0:549:8d2a:8820 with SMTP id 2adb3069b0e04-5498d2a8c94mr269219e87.17.1741248984470;
        Thu, 06 Mar 2025 00:16:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30be99c815fsm1264581fa.69.2025.03.06.00.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 00:16:23 -0800 (PST)
Date: Thu, 6 Mar 2025 10:16:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Zijun Hu <quic_zijuhu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Subject: Re: [GIT PULL v3] QCA: Add and update Bluetooth firmwares for
 WCN685x and QCA2066
Message-ID: <fblss3wgrwhytnedaafxc5vrz7mvo6fnckqjzmflrelrvyqlbd@xqvdtuoioqih>
References: <628a50fa-d0c1-49f6-8df1-9a7e9abacb58@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <628a50fa-d0c1-49f6-8df1-9a7e9abacb58@quicinc.com>

On Thu, Mar 06, 2025 at 03:57:06PM +0800, Zijun Hu wrote:
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
>   https://github.com/zijun-hu/qca_btfw qca_btfw_0305-2
> 
> for you to fetch changes up to f573fa75ee6cdc6d176cadd0e63059f6c082928b:
> 
>   QCA: Add Bluetooth firmwares for QCA2066 with USB transport
> (2025-03-06 15:43:38 +0800)
> 
> ----------------------------------------------------------------
> Zijun Hu (4):
>       QCA: Update Bluetooth WCN685x 2.1 firmware to 2.1.0-00653
>       QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00653
>       QCA: Add two bluetooth firmware nvm files for QCA2066
>       QCA: Add Bluetooth firmwares for QCA2066 with USB transport

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Thank you!


-- 
With best wishes
Dmitry
