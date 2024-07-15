Return-Path: <SRS0=/xlt=OP=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2533FC3DA59
	for <linux-firmware@archiver.kernel.org>; Mon, 15 Jul 2024 12:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F79BC4AF0A; Mon, 15 Jul 2024 12:19:23 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2F4CDC32782
	for <linux-firmware@kernel.org>; Mon, 15 Jul 2024 12:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2F4CDC32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52e99060b41so4369148e87.2
        for <linux-firmware@kernel.org>; Mon, 15 Jul 2024 05:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721045960; x=1721650760; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AirN9AaG97xF0J6M3pd1tEzg2nxbKMsQsM9U22/k1nc=;
        b=pLRqGyzXhwFubLsyJre8Ag0YBEn3EBc6CouN5LmVqyl3mkPVQgcpJEiMJQJAdifXeO
         8tF+cAcgpm1GMCNeqw7YfBnvVvcNwpFe4fro/ulnsP9YaHxT1FL7AEc2gEeokV0mVmoR
         f99VXoUvZ3E6bE49YGLa5hBLdrJ7XXWDB6IB7lLhjlt+cU/J6ud0hVYbdQi+VlaCmAYz
         ak0QRw6qyDeHCsc1wRh4rEp8FC3AhSSWyXRNtPjVYZvwtNVO0P0/uk7lmSnaI+DgcXtq
         9Z9XkAyaIknUo0LgPpgOcDhk1okX3rJRBWN2PH8SfCrJnizugr1Gfp3dMiSgE0e2AFt2
         bQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721045960; x=1721650760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AirN9AaG97xF0J6M3pd1tEzg2nxbKMsQsM9U22/k1nc=;
        b=P9PXNIrJ79VJpoVBn88TS55NbqesjyGckmmZh8KosOJ2rToBIiT4LOXpAtLyQtK0LU
         eIh6qEXMHJv+bIVQPvRIebChMxvMVlb6KD4YvcStquuPMjEzpfMHTGE5vDy3IyaA35da
         nDliJNAq7kgH/ExJuPrDag9+JR6clYq9rnFztcjszKGS03FaZEi3ZtC+Qu3CTkylE7SB
         8Yyltmd2BBFQHvWgTqkCLdFjwEN5L/za0Av9wRbIG8llUBg+ybYnbJ5nFv8Aphy+f4Jb
         892TAp/RxpiNgKL4JvcwN/QKR5kRg+uQ2SaLQ1E++2he62gp6RZvkf68MwiWDzvGdW88
         Tnqg==
X-Gm-Message-State: AOJu0Yy/SnPpCpR3m7NpCdoD3moWRnnn3zomK3J6WYaZxXVEFvGIR37/
	Z50BpjG2B/58j7rL0XAJFDFTfeYY07ng4ZeKrkubEk3h3ZdqF19BWpzoA131imU=
X-Google-Smtp-Source: AGHT+IF5YA/83IfdbW0XrNTUxJLLP6oImjkgYB5h5Ztzm/+FX+Gf9dsfz8W7yKexHzUp19QKG50Ozw==
X-Received: by 2002:a19:a414:0:b0:52d:582e:8093 with SMTP id 2adb3069b0e04-52eb9995541mr9732971e87.23.1721045960313;
        Mon, 15 Jul 2024 05:19:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed24f5938sm833626e87.117.2024.07.15.05.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 05:19:19 -0700 (PDT)
Date: Mon, 15 Jul 2024 15:19:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, rajeshk@qti.qualcomm.com
Subject: Re: [PATCH] qcom: add gpu firmwares for x1e80100 chipset
Message-ID: <ebqrik4chxjjabhdozfu54ifc6xdojisqfcojcggov74kyva3b@lafmmd3qxpzn>
References: <20240712175922.3740583-1-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712175922.3740583-1-quic_akhilpo@quicinc.com>

On Fri, Jul 12, 2024 at 11:29:22PM GMT, Akhil P Oommen wrote:
> Add the following gpu related firmwares for Snapdragon X1 Elite
> chipset (x1e80100):
> 
> qcom/gen70500_gmu.bin: v4.03.11
> qcom/gen70500_sqe.fw: v1.62
> qcom/gen70500_zap.mbn: v0.15
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  WHENCE                |   3 +++
>  qcom/gen70500_gmu.bin | Bin 0 -> 81312 bytes
>  qcom/gen70500_sqe.fw  | Bin 0 -> 77332 bytes
>  qcom/gen70500_zap.mbn | Bin 0 -> 12088 bytes

The ZAP firmware is signed, so it should have gone to the SoC subdir.
I'll submit a patch to fix it.

-- 
With best wishes
Dmitry
