Return-Path: <SRS0=ZqBG=SI=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CE5D462B3
	for <linux-firmware@archiver.kernel.org>; Wed, 13 Nov 2024 14:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 120A1C4CECF; Wed, 13 Nov 2024 14:43:29 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B02FC4CED2
	for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 14:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2B02FC4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb470a8b27so7996531fa.1
        for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 06:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731509005; x=1732113805; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Fgxx52k6cRO07TbzcbtVihhXwwHHKoYqCr4jXepQY4=;
        b=afmyFxFtGyJ6vWdmdGDqiX1vjQTM6CllQQB5hIKUkpD6Y7eWWHOIF+kNtiQr8cTIAs
         Ql6jyvZljbItIwGMgHf+QNbSOvRdQNq2ZOxZSEuzHMEi0MdCHGHT+Z2BgTVa5ndwfbqx
         XuQdzjy0GIOpe97PJAaEja8OifZJ/EaimqeamtoKXdhq5pUT0STFkcEZZHhJO+G4TEAP
         J0DkZ4LInIneKxYMUzkCoYsGfa0Ye6Pf9qtVJm1f06oS4LOnztHN1X1FN7on8iCHoT7G
         RC7JlvZO5ej09SDaEwS2tdCreWQnMbQEowjJt+nBRkIRzO2qap06hTL9+DkeAyEOc5s6
         sgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731509005; x=1732113805;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Fgxx52k6cRO07TbzcbtVihhXwwHHKoYqCr4jXepQY4=;
        b=gTXBkX3yt1Wl0OZ3+6OmWFHNKUX7LDyMVa5wTxSYkH38BaxK1U9D+aCaVIQJH8BcUn
         RuTZOJdW0mHtOz4/RaWOyu0L9puVjTGG7Xtr/WEMuGYUf6oPiZALLs0YCK2CG6uICDly
         8nxChF67tvFhN5i2aDy1gpEuMgIFDxTcj80u7urmEOu6t5bvc25US2Y3mv1m5ovqFT+0
         mGrX4/SpNZJrL5EwGG3fT7jw1NnYYPAGD3ZeTTJ0fCdSvFOoTx7I5pMCdqZlyjgPppLW
         WwppIgfYts9ntftQya6ywjoDAD64gVRnxRjLRswpfyggk0zbFdu/6FBS+LxbaRVGoTsw
         aJnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUat5m2iPAjRj7WGvXx+X/zwNZbmbgpyxj2lKH2NZNBkpRb13T3u8S22sbveAXk4hxriptjH3lGphvDUE1ncA==@kernel.org
X-Gm-Message-State: AOJu0Yxh67eZ7Cfm6WTril+txkATRwoudEL6wyT6sTIG/oSNmefpEt5B
	gfOps5vnHyl8s4LfyMatJcPPLnS3DzwG0lXk+HMSDB0H8KGuAvSQPBTEQ0dlraE=
X-Google-Smtp-Source: AGHT+IGuiQS8G3KYXVswMLT60oAVcwWDVcPu0Sxo4baUZ//Xkb7Dph3igRYbKe3iHN/BqoaKE9wphw==
X-Received: by 2002:a05:651c:b2a:b0:2fb:597e:28f5 with SMTP id 38308e7fff4ca-2ff1f418805mr76208821fa.2.1731509005205;
        Wed, 13 Nov 2024 06:43:25 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff178f3ca9sm24086331fa.41.2024.11.13.06.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 06:43:23 -0800 (PST)
Date: Wed, 13 Nov 2024 16:43:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, 
	"Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, 
	"quic_zhgao@quicinc.co" <quic_zhgao@quicinc.co>, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: add venus firmware file for qcs615
Message-ID: <v7ltgyxqzrt7pmcgy7bfsanfxbuu5fr4rn7yxg7hal5londeqj@44v32zea44hg>
References: <83153c5ab8374e008d62646f200f9a04@quicinc.com>
 <CA+5PVA6B6cJ4sTVF_HN84_ommsMJzK5OsuaG+ikrzV1Sm441Jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+5PVA6B6cJ4sTVF_HN84_ommsMJzK5OsuaG+ikrzV1Sm441Jg@mail.gmail.com>

On Wed, Nov 13, 2024 at 07:22:28AM -0500, Josh Boyer wrote:
> On Wed, Nov 13, 2024 at 5:50 AM Renjiang Han (QUIC)
> <quic_renjiang@quicinc.com> wrote:
> >
> > Hello
> >
> >
> >
> > The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
> >
> >
> >
> >   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> >
> >
> >
> > are available in the Git repository at:
> >
> >
> >
> >   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git video-firmware-qcs615
> 
> Merged and pushed out.
> 
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/370

Josh, it is very nice to see a promt merging of the firmware, thanks a
lot. However is there a chance that you can give reviewers a time to
react? Usually there are no issues, but I think it is important to let
the comminity to be able to review the patch / pull request.

-- 
With best wishes
Dmitry
