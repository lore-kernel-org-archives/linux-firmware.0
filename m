Return-Path: <SRS0=ZqBG=SI=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C1AD462B3
	for <linux-firmware@archiver.kernel.org>; Wed, 13 Nov 2024 14:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8291C4CECD; Wed, 13 Nov 2024 14:40:26 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9F942C4CEC3
	for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 14:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9F942C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53da3b911b9so263424e87.2
        for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 06:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731508824; x=1732113624; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+jZgAqEJpwS2/uZrgxbz3yGy8AU7XccctO9yfSAbCGk=;
        b=FMDVsJ4FfMlc4YaYBWlN6HaxHwxhfUQ30LFGj9na51WTJ+Uf7Opu6oS1+/YoFAxA7b
         uO5olXhq1Km+jH/2VBz2RgIJcFJ2YV9woCgRozCHF4WM3TazY4FYaGoj5awXmwuWoJq9
         +BMEs8qEdKrz264KooxKxcIzCWZ7zRbQoENJ6yM/sFlkNOcY/g2YCUb9yhPvmOvMPAHm
         2KUvIqXKayeZLHlw6weBHSM0FjBhfpX8osc/lpJs42kdh9MMk+zTnGaeAV7eeReaBALU
         GPDcL2n098NXVggVKIdLdnccfMmOlgmwKRe0FEGCo5j8++FulOY1fIA8ID/Oh32JNw7n
         Pubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731508824; x=1732113624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jZgAqEJpwS2/uZrgxbz3yGy8AU7XccctO9yfSAbCGk=;
        b=SjE4BadL7QkGReFOvZfxXFAyxicYcxmZZqeyDuUdastONzMyk5m3xNexcoMlwlZz+y
         6kKCY8M3tY8wxqtVdA0ZM35fsuFIJu3W0NsI9PT4AL+H9L6xYT43EQs/NxMuBPZKK6vi
         MYc2q8NWCxWWMgirvzWXkKvr/vHUABksfZr77gbkdEhgNIKrljbKoQ0Ck5coA0LfjqbR
         5zaI/aMCOds3ly4uTrET8PfyhyRtG6yxiQ/5h4xxl4lnxRAUBz/lP4Ce1QNthW27Mp+g
         /759QIQKwySpfyqTRFLxHBjLzxgf3Oack42lpUAhKOazQBt6xAjsNoM/rAdY8n+nr4yw
         YWmw==
X-Gm-Message-State: AOJu0YxgQV23ep9U0jRg45tIls2HOehX1KKgxL1VyFx4IopoM4fK3wAZ
	MT9JQGRan1Q5jt1QBkbO9Bb79j+kDI7Jeg0dDiyfpNK49Jf5jvELlEfIAXtCo98=
X-Google-Smtp-Source: AGHT+IESnonn4WA4V9eAjCb/Iy/klqjLJDKWelbfGSY+1HFO27ggzmsjtmHQ30X+wsA8ipHcmH9rqA==
X-Received: by 2002:ac2:4e08:0:b0:530:ae4a:58d0 with SMTP id 2adb3069b0e04-53d9fe7231emr1712966e87.8.1731508823612;
        Wed, 13 Nov 2024 06:40:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826856e9sm2212984e87.66.2024.11.13.06.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 06:40:23 -0800 (PST)
Date: Wed, 13 Nov 2024 16:40:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, "Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, 
	"Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, "quic_zhgao@quicinc.co" <quic_zhgao@quicinc.co>
Subject: Re: add venus firmware file for qcs615
Message-ID: <ng4o7sdejoh4jn4nnarjd4lio4lbx2tiuiz5c6bigjbtxldinr@xl5wx6dmdivy>
References: <83153c5ab8374e008d62646f200f9a04@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83153c5ab8374e008d62646f200f9a04@quicinc.com>

On Wed, Nov 13, 2024 at 10:50:44AM +0000, Renjiang Han (QUIC) wrote:
> Hello
> 
> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
> 
>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> 
> are available in the Git repository at:
> 
>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git<mailto:git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git> video-firmware-qcs615
> 
> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
> 
>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 +0530)
> 
> ----------------------------------------------------------------
> Renjiang Han (1):
>       qcom: venus-5.4: add venus firmware file for qcs615
> 
> WHENCE                      |   1 +

Could you please be more specific, what is the difference between the
existing file and a new file? According to the soc_vers the new file
supports sdm845. Should it instead replace the old firmware?

> qcom/venus-5.4/venus_s6.mbn | Bin 0 -> 922240 bytes
> 2 files changed, 1 insertion(+)
> create mode 100644 qcom/venus-5.4/venus_s6.mbn
> 
> Best Regards,
> Renjiang

-- 
With best wishes
Dmitry
