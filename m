Return-Path: <SRS0=Oev7=SP=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800E9D6392E
	for <linux-firmware@archiver.kernel.org>; Wed, 20 Nov 2024 11:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5AFE0C4CED6; Wed, 20 Nov 2024 11:22:57 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 54E6EC4CED1
	for <linux-firmware@kernel.org>; Wed, 20 Nov 2024 11:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 54E6EC4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb599aac99so43600021fa.1
        for <linux-firmware@kernel.org>; Wed, 20 Nov 2024 03:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732101774; x=1732706574; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bQiVlXJQi/VK9tRXY+qooanaI30URiLhdo7sIgDslow=;
        b=M1HrrIvcIr4As8MfMy6VnYrss8S3gDkepeNP60RM6qhGXVQThlUgFDnPI+IWhr3QaE
         T6kANhWTOG4uJ2GBmTJCBnqzup/UHnKjpKsP+QayaCXrcI6U2XWRCeQYhVvM+KjNRFKP
         VQpjlqsJuH7sD1wM2HctFLfk3AsAJfVZOqgYgVSYk2TM5rFWsl7U6aAvXxAZUMeN0Crd
         91mN8PWd+j2+EaX4Eepp682ap73evOU3mQz7bot/L6EVgP+6C5c87a6jP36RyTPx56NZ
         3QhN9N1hK+fY1hIYEGsx3u7+e3nfQO0TCNyahzmcHzRT5VWXglAqKOkELZPvmmkkhuSI
         17zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732101774; x=1732706574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQiVlXJQi/VK9tRXY+qooanaI30URiLhdo7sIgDslow=;
        b=IcbpYjOrTC13CY24vOel8bXbV+yfDGGc3HwmlWLsgOsHrjzJF1fN5nEUbRTcMDagmh
         6i5HPgIfPfE6flymeefnAvcGBLnY8JJ6e99qKVkNbBvpWccpFokBzaSoj4FbTlCA2KqC
         nvbaQQbADxN6ttNTK+NCcfh9CIVBKNLSsv6TiQzdos4pqjih7avtPjQVBj6jlOR8TOPK
         10WRvFfK4zztPcYNPKjI5BJ27uKqwKKL4XLLxyTw/Og+/hwj1KETPSM55qV8VwJwvQvU
         TJqn+UB2dpVl1/+3uvLTD+WDHKYMBFLEtNHjJ9YEXv6mMEFQjr47+OnQkKsD8HniPBjy
         kyvA==
X-Forwarded-Encrypted: i=1; AJvYcCUMxFoA9pEVtTIxRWBXhji0exZz4UpF/MdpPk8EYDU7dOrEfpOKvzgU62J0NDGWL18W67uBDSqdyYCMfc89qA==@kernel.org
X-Gm-Message-State: AOJu0YzRhapHyboSZ82vfk8vJQixKoELpNKizvRlRoI5TNtMXddTKWGw
	Ecfg7xCq47AMnrIRbDtOl9qC9LVhlXqFraF/oFjsIo43AqmhNoyRxkv1TcKA+ic=
X-Google-Smtp-Source: AGHT+IHzeBEZkGiXTUGchf05G9qXy0QSvlmcCHEMFt2ig0UCdDl7oRuB2wCtA374ksARIUfZPEb4rg==
X-Received: by 2002:a2e:bd0a:0:b0:2fa:cdd1:4f16 with SMTP id 38308e7fff4ca-2ff8dbff92emr12411911fa.14.1732101774356;
        Wed, 20 Nov 2024 03:22:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff69b15797sm14946211fa.108.2024.11.20.03.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 03:22:53 -0800 (PST)
Date: Wed, 20 Nov 2024 13:22:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, 
	"Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, "quic_zhgao@quicinc.co" <quic_zhgao@quicinc.com>, 
	linux-arm-msm@vger.kernel.org
Subject: Re: add venus firmware file for qcs615
Message-ID: <pukoimsqhck5oymirmgiwad6s3l6frt7xbahp7juhvj3rt4622@wpajx6vyw5nl>
References: <83153c5ab8374e008d62646f200f9a04@quicinc.com>
 <ng4o7sdejoh4jn4nnarjd4lio4lbx2tiuiz5c6bigjbtxldinr@xl5wx6dmdivy>
 <ab4f83c1-5cd6-a80b-fd85-ccc337c8f301@quicinc.com>
 <pqoq64hk2jedmqta5fs4ktcadw4getwkgz324vtrzzotcurpaw@zc6dlhbqtsnz>
 <a1bbc1d0-d3bd-e44e-e393-a7ade909a506@quicinc.com>
 <CAA8EJpoDXKbF5cqb_vzE28zjdC6OC66Zxb5j030QXaCe+FUmfw@mail.gmail.com>
 <egdqhgdiqqny57yiauiyekcvhxvebfttyncqoazslzjprwvakz@txvy7wn4vg7g>
 <a259c98c-6c77-1c1e-e428-41c2550f7517@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a259c98c-6c77-1c1e-e428-41c2550f7517@quicinc.com>

On Wed, Nov 20, 2024 at 04:40:51PM +0530, Vikash Garodia wrote:
> 
> On 11/20/2024 4:09 PM, Dmitry Baryshkov wrote:
> > On Thu, Nov 14, 2024 at 01:31:14PM +0200, Dmitry Baryshkov wrote:
> >> On Thu, 14 Nov 2024 at 13:05, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
> >>>
> >>>
> >>> On 11/14/2024 4:16 PM, Dmitry Baryshkov wrote:
> >>>> On Thu, Nov 14, 2024 at 09:06:55AM +0530, Vikash Garodia wrote:
> >>>>>
> >>>>> On 11/13/2024 8:10 PM, Dmitry Baryshkov wrote:
> >>>>>> On Wed, Nov 13, 2024 at 10:50:44AM +0000, Renjiang Han (QUIC) wrote:
> >>>>>>> Hello
> >>>>>>>
> >>>>>>> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
> >>>>>>>
> >>>>>>>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> >>>>>>>
> >>>>>>> are available in the Git repository at:
> >>>>>>>
> >>>>>>>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git<mailto:git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git> video-firmware-qcs615
> >>>>>>>
> >>>>>>> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
> >>>>>>>
> >>>>>>>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 +0530)
> >>>>>>>
> >>>>>>> ----------------------------------------------------------------
> >>>>>>> Renjiang Han (1):
> >>>>>>>       qcom: venus-5.4: add venus firmware file for qcs615
> >>>>>>>
> >>>>>>> WHENCE                      |   1 +
> >>>>>>
> >>>>>> Could you please be more specific, what is the difference between the
> >>>>>> existing file and a new file? According to the soc_vers the new file
> >>>>>> supports sdm845. Should it instead replace the old firmware?
> >>>>> SDM845, SC7180, qcs615 can be enabled on same firmware ideally, but due to a
> >>>>> different signing for qcs615, it takes a separate bin (xxx_s6.mbn).
> >>>>
> >>>> Can SDM845 handle v6 signatures? It supports v5 and PSS. Or can QCS615
> >>>> use v5 signatures?
> >>> Infact we started with loading sc7180 firmware on qc615, video init failed. So
> >>> far i have seen 2 categories in signing version for video bins, either default
> >>> or v6 specific tool.
> >>
> >> Can firmware / security engineers actually advice us on using v5
> >> firmware signatures with QCS615 _and_ with older platforms?
> >> Existing venus-5.4/venus.mbn uses v3
> > 
> > Vikash, any updates on this topic? Would it be possible to have a single
> > FW image with just v5 signatures?
> Not yet Dmitry. Having a followup with relevant folks this friday to understand
> the signing requirements across different SOCs, hopefully will be able to add
> something on this by then.

Ack, thank you.

-- 
With best wishes
Dmitry
