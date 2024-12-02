Return-Path: <SRS0=4ZzB=S3=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3D8D78301
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Dec 2024 10:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D6AAC4CED1; Mon,  2 Dec 2024 10:17:16 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 46D57C4CED9
	for <linux-firmware@kernel.org>; Mon,  2 Dec 2024 10:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 46D57C4CED9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ff976ab0edso39162131fa.1
        for <linux-firmware@kernel.org>; Mon, 02 Dec 2024 02:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733134633; x=1733739433; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fp2Tvwa1N0wG+8UyBtBfC1u2psMnWBAjscHJdBrM5T8=;
        b=wv5w615tzDeo0I7FCjsbFxHYr0IAkSk/eudM69MXdihvv6IiHEoAYRA5jOKBKliFzp
         eh0px9QkxlFqwXPCxLp8xTB0moNsN6R/qvMxTbfxEAE6YdYtNjOIMQjEHfLXfIAaCExg
         yq8BC1A6vEW0kJYzjkGavtNqYNjoK0tEe8W1UX4GGch6VVeUmRMJToSJnOdT5pXJuAPe
         xholS/uH7K4vBBNFDBF8+w6hSnV1/Fhn0VXEMHHXZWP9/mAaPOVKYm2gKs/HuO1WoPrH
         ZLPQALekallpcmiV3OL6C6lVRo1mbaDJp6/CoU0EWpu66WNG1mqnGPtW715gKvtXNg56
         igpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733134633; x=1733739433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fp2Tvwa1N0wG+8UyBtBfC1u2psMnWBAjscHJdBrM5T8=;
        b=OtNgyhyvawJgl76jW3Q5alRr1jKsraKXSSwX8LGhyyOD2UGL6XSq7b+U2KSdvJTnyb
         6J93xAt06wUaM9cg29TXm4OfeW5BpUY6Rboiy42xR3SJEf263JNrfo3sLT6C7ZjhIIpm
         5zLQAe+7FuV2CHs/6rXUSsGWpTFePtc1pL4PDcDena9yp4HAE+CuaYhxN9La/55nOEBS
         Dm1Vm/j4t2GM0DSfLID1G/c7KIX1pYkRQzkq/wVXKnSa/+qSLysLCeUERPhk2n29IFgV
         cMVdNw/udeeUeJTnXs9FO9saup3KHT0hbN75yCTt1VUgaEbRXXcT4/FamKPGTk1kuckF
         3osQ==
X-Gm-Message-State: AOJu0YyWOUr09tuFe99gl1SAiZ2UULBjvv28Z0ic4NgpmIz20EphQSPu
	Cm/hlYu3X4mYpt0nDgCwaOwNs6M+Dz/hG526FXpISY4/6FFsbshkKlGCSCQGd4uF/6/5d135gN3
	S
X-Gm-Gg: ASbGnct2DuSgYC6pL5vFtcXsWK9IWmRN+KPWxSMRzIK5oErc37qLVPatwQtMJVZBkX/
	+IUa8iXl8J3Yo1XS7DgUAIue8E51wjrU1LAxeAy5pnVf36nmCPEcbYblLG/w301GJbt95HM1Rk4
	rgzkbQ5oB1xt7PE+agwHmclox4UDSAwSC8ZXVnWe8jcKZKH/aJYqOd1JnHMQdO8eiVjvuWz7EDV
	lqxovn7dri2bTOvH6MvqpKIqpZZmMcRfwUcuu4fUp0lSJe8JcMWSJOt6j2sE0+HBcj0yppJh6l2
	esrDRT0wM4yzdc8iOCPqdDLvhY4a3w==
X-Google-Smtp-Source: AGHT+IGM5DnlDduUqBULHMa0qhGDRCPkKwcnDqlrx6KZxcEFtSWwVctWq/TpmY8Bo2wGb3B8ILNPFw==
X-Received: by 2002:a2e:a547:0:b0:2ff:d32f:f881 with SMTP id 38308e7fff4ca-2ffd610e8a7mr108733131fa.38.1733134633445;
        Mon, 02 Dec 2024 02:17:13 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfcac42csm12482901fa.111.2024.12.02.02.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 02:17:12 -0800 (PST)
Date: Mon, 2 Dec 2024 12:17:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: quic_zijuhu <quic_zijuhu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Subject: Re: [GIT PULL] QCA: Add and update Bluetooth WCN785x firmware to
 2.0.0-00515-2
Message-ID: <cq2po7zw46nryv4lzdopfqv6dut632ax6c4ezcqbrf4w7qsdi3@cedllayr7nlb>
References: <5cb9ed4a-2c4e-4f6a-9277-840c25bc24c6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cb9ed4a-2c4e-4f6a-9277-840c25bc24c6@quicinc.com>

On Mon, Dec 02, 2024 at 05:31:32PM +0800, quic_zijuhu wrote:
> Hi linux-firmware maintainers,
> 
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
> 
> The following changes since commit 7c3031c18ab851792c49f594a4d43200d55a7943:
> 
>   Merge branch 'robot/pr-0-1732634796' into 'main' (2024-11-26 16:12:19
> +0000)
> 
> are available in the git repository at:
> 
>   https://github.com/zijun-hu/qca_btfw
> 
> for you to fetch changes up to 7f116580d9060feaedaed55eb65c63eeba59341f:
> 
>   QCA: Add Bluetooth nvm files for WCN785x (2024-12-02 17:05:12 +0800)
> 
> ----------------------------------------------------------------
> Zijun Hu (2):
>       QCA: Update Bluetooth WCN785x firmware to 2.0.0-00515-2
>       QCA: Add Bluetooth nvm files for WCN785x

Are new / updated files covered by LICENSE.QualcommAtheros_ath10k or by
LICENSE.qcom?

-- 
With best wishes
Dmitry
