Return-Path: <SRS0=5j3L=QP=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB930C3ABA2
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Sep 2024 06:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6ADF8C4CECE; Tue, 17 Sep 2024 06:38:28 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 779D8C4CEC6
	for <linux-firmware@kernel.org>; Tue, 17 Sep 2024 06:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 779D8C4CEC6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5365c060f47so5658234e87.2
        for <linux-firmware@kernel.org>; Mon, 16 Sep 2024 23:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726555105; x=1727159905; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QYtQouVq2+ET7X0FX1a7PsLliHLNF7Qx32sXu40R69w=;
        b=g7U3CCOY2ia2OFXOcxfTa+B3cC5tJZTYD6kRkE1JtABASmlBLlGqudqzKylCAtlc96
         FppRK5zXwMp/SJxXtiDz0UwLqXnKKlGgVUa4M7T9ZRFoqoYoCgOwAmK0uwnbj5XgYYq3
         AgoiJmUTaWIwQPdVhEKSNCNMIA6UM3HVY9Vi91v/tE1kRbyQg4WpZvpbnTJefwrcnx9J
         wYpNKcnWSKANWcMHn8HUZXI6HnO8tvUyfN+3fg4OcPq4T/bkUhWkv8aumCMDLpFZLnES
         L5JWe+VvSvcbSL0SJsqwPwJRbhIWpTNy1jJbcJSCO6xjarGwAMja3CuEv/OPCZXnjFi+
         ES3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726555105; x=1727159905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYtQouVq2+ET7X0FX1a7PsLliHLNF7Qx32sXu40R69w=;
        b=DO02TjLOFyt8lEIMeXwR+2PpYSmPalEnQbUvtgMYNriZdBemVGUmkH26W9l29UQglh
         75S9ce9bML+xo6j4Qk1i+8QtratOS8kcsrZwpTu6IE3tzqI+127jfHyB984kLTg5ohae
         FdE2eQvDOoQ0zgsccBvAnaW4oR+8q+gUHHrQc22jqmKAEqY10vyZ8g/GF22n3b69/o4k
         8TkxjsWtjq9T2LTM9FL6YtPzis5e5uO5AAgiK2vaBN/hDsDIe+BTCFh9bwpLcHzlxLXi
         rVSZ9yPtW70Hn6kAsRkh00WrWsyFVLkuRBBDHdpKKoGrzG78r3Pb1iFhG/jSaSYGlBS6
         dhHg==
X-Gm-Message-State: AOJu0YwAeaZCjJgVtWRN2uQhzi1r98UPV7+adlgjk4Iz5OUQnnWTS0YJ
	oqXQB8pcKyUjbSVwkXMwR2JavgxlOHp8zc4zeFvLXQk8yC7TsLv/bsgKHmohGok=
X-Google-Smtp-Source: AGHT+IH2Lx8vuXDwaE6XMOqwecwrVkOeWCIBR1/ujcVJ+HP+MPw0UAtM1HB8wyiboa1TyGIohYjEoA==
X-Received: by 2002:a05:6512:e9e:b0:535:6cf6:92fc with SMTP id 2adb3069b0e04-53678fb74d2mr9320210e87.8.1726555105105;
        Mon, 16 Sep 2024 23:38:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5368704db51sm1102666e87.105.2024.09.16.23.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 23:38:24 -0700 (PDT)
Date: Tue, 17 Sep 2024 09:38:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, quic_rajeshk@quicinc.com
Subject: Re: [PATCH] qcom: add gpu firmwares for sa8775p chipset
Message-ID: <tlq62pwr7qsoerfjyn4cnoefllw4gbyyoocon3si45om7ua5oc@ikfkikb3xw3u>
References: <20240916220450.357752-1-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916220450.357752-1-quic_akhilpo@quicinc.com>

On Tue, Sep 17, 2024 at 03:33:16AM GMT, Akhil P Oommen wrote:
> Add the following gpu related firmwares for SA8775P chipset:
> 
> qcom/a663_gmu.bin: v3.05.01
> qcom/sa8775p/a663_zap.mbn: v0.09
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  WHENCE                    |   2 ++
>  qcom/a663_gmu.bin         | Bin 0 -> 55892 bytes
>  qcom/sa8775p/a663_zap.mbn | Bin 0 -> 1054680 bytes
>  3 files changed, 2 insertions(+)
>  create mode 100644 qcom/a663_gmu.bin
>  create mode 100644 qcom/sa8775p/a663_zap.mbn

Got the following error when trying to apply the patch:

Applying: qcom: add gpu firmwares for sa8775p chipset
error: corrupt binary patch at line 905: --

(git version 2.45.2 and 2.39.5)

-- 
With best wishes
Dmitry
