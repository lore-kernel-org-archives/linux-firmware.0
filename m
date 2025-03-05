Return-Path: <SRS0=dSwK=VY=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E548C19F32
	for <linux-firmware@archiver.kernel.org>; Wed,  5 Mar 2025 20:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45124C4CEE8; Wed,  5 Mar 2025 20:35:21 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C620DC4CEE0
	for <linux-firmware@kernel.org>; Wed,  5 Mar 2025 20:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C620DC4CEE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-307325f2436so71268741fa.0
        for <linux-firmware@kernel.org>; Wed, 05 Mar 2025 12:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741206918; x=1741811718; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zqJWlhWE10y5qXTKbqCwhszEMAOBhhVdU/VwCXwFr2M=;
        b=pHSLNuggpnmzT+3coKTdGK4tZw8RvOWk3cFuFrXlc0v5702x/ZLFIxZuvIfID4gSly
         dOskEqgcA/VbK6F6E6o+E/5za4xTqGkwz6d6x6RDBVjFWyDNHyokyfa6kf7xNwblIZab
         lBaUUjsFYGRkp2HCGwPPeNiN5SVo59VFRrx5WxL5a1mdOT0mYwISIsTS/qFy11+H1XRe
         8U5lrnwEzQsRhPqPSJ9p7VhgJFjBst2XWBJFFCIXOoloWm3R4B6ALPP3J0ZKDQmL1sd4
         RbAS5oq58lXchfnO6kKS5cdkytEHuRZMyM74UXeL8Q04GDS13daphra+6B9GcPKGD0/9
         yXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741206918; x=1741811718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqJWlhWE10y5qXTKbqCwhszEMAOBhhVdU/VwCXwFr2M=;
        b=qUqxssOCJbaVrI8N5BE1cfU/zsTn2cQ8b6qDxzZ6K9Vpy27zRQWkd06rzVy9UpLqfD
         xedZOs/y0gbkVd8fEORk6SxBZR7xhbkeelvKbgvpu1j4xp9R3tRAamS4D4wx1/Iuu9ZF
         BhtewYXEIcfcn13u3j2iqVsyBrpLId7cjDPfr1BC8Tpk4E6LVkP1VRsAKCyF9h0EW3fC
         0nBr5BMoMDjoteD/yE/QMk9bg+MHSWmqujUH9WRkFnEkDyxe6E2XFLPPLW3TL5bzMwsm
         Sxme/LGxP2//xMCBh9LPvbL94JRIbRCe5FwQWHBLCQqGT2dWdhbNB7XObPZCwXdZMQwb
         EN+w==
X-Gm-Message-State: AOJu0Yy+mq4HOQjlcts7TjXffCYxVSuBwNL3N/yNAPEKhCxtSkF4GyPd
	8vV8+zBM103FWHlxbDTPyb2DerUkEy5Lu5moyJRrudlcIuP83DggPiKpB/zt3y4L+c4BHyEJQRe
	UxBk=
X-Gm-Gg: ASbGncsF8iG3DGuqiPolsoKEwh8g0qAljGd65sdUjs3e570tK7+qTReIjAy5vW854WH
	lrm4kgx1HLngxexA1eJDPyh7wtcY6YOdFeSUO5jKJHyo8Oi32Ze/cEc/y1RimOs0JdnrWtF0Xew
	Mkam8EjwbsXxFCRa1yzgEFEofL/dr+3a7GPok+qLHzuf2ln5e5zLcG3cpM6A2ZEB0IF0TrkdUlv
	8oIzBugBYhLNzGMvUZO2433U+nf4/yWwTLL011t4xEIiTQLI7+jEASTdo9Ctp6yzl79P0BrDRYq
	SOibezOeRkmGXKbtBh8KjHA051aaMqcL1Z+Z/IJluitdBdrVteyaa7tpyIf7Has1HC2n9k7uEyL
	xyjTLXdVyMj0l5nboqwnqdozB
X-Google-Smtp-Source: AGHT+IF3wqXtvuKNuoFHqDsQVnnJxUNcGr+U5wI2kfTpyvtwQOo/LA2xzDq/NdDRl5MEX8rFgzhLZg==
X-Received: by 2002:a05:651c:19a4:b0:30b:c2ea:46fc with SMTP id 38308e7fff4ca-30bd7a4a29cmr18242041fa.10.1741206917650;
        Wed, 05 Mar 2025 12:35:17 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bb05a5757sm13144841fa.88.2025.03.05.12.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 12:35:16 -0800 (PST)
Date: Wed, 5 Mar 2025 22:35:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Zijun Hu <quic_zijuhu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Subject: Re: [GIT PULL] QCA: Add and update Bluetooth firmwares for WCN685x
 and QCA2066
Message-ID: <atz6kvfby5w6hpd74ik7bjkwrt53uzga666qdzzjdnum7nzk5t@yajr6l6y2zpt>
References: <01571886-3cfe-4aa7-baf7-d474ba093b6c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01571886-3cfe-4aa7-baf7-d474ba093b6c@quicinc.com>

Hi Zijun,

On Wed, Mar 05, 2025 at 07:02:38PM +0800, Zijun Hu wrote:
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
>   https://github.com/zijun-hu/qca_btfw qca_btfw_0305
> 
> for you to fetch changes up to 16906ee494a2c7c26477c29deaf1349b4c1751ed:
> 
>   QCA: Add Bluetooth firmwares for QCA2066 with USB transport
> (2025-03-05 18:16:33 +0800)
> 
> ----------------------------------------------------------------
> Zijun Hu (4):
>       QCA: Update Bluetooth WCN685x 2.1 firmware to 2.1.0-00653
>       QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00653
>       QCA: Add two bluetooth firmware nvm files for QCA2066
>       QCA: Add Bluetooth firmwares for QCA2066 with USB transport

It looks like you've largely missed updating the Version tags in the
WHENCE file. Could you please fix that?

-- 
With best wishes
Dmitry
