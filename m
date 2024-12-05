Return-Path: <SRS0=rw9f=S6=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA5DE7716E
	for <linux-firmware@archiver.kernel.org>; Thu,  5 Dec 2024 18:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85BA4C4CEDE; Thu,  5 Dec 2024 18:54:22 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5C1EC4CEDC
	for <linux-firmware@kernel.org>; Thu,  5 Dec 2024 18:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E5C1EC4CEDC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53e27bad7a4so680192e87.3
        for <linux-firmware@kernel.org>; Thu, 05 Dec 2024 10:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733424858; x=1734029658; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=47fbT02VGMzZMhx7Sp5S8kr/f4uVejY30NijTPy/sD0=;
        b=v0d3GSBecr3NUDLQN/au3mNGep6/cbbiuX6runHAWhQlqg1gIYczcwy5NzWAuRsrpR
         1x9snCXxW03sAnFCTEY/df758ljZ395G2/4f0PmQEaTexZC5+Mqi16pKVfqCjktYzPB0
         MML+IyF6zIqI88SK3SZczlwDxVgply5lKTbMCIq8CCp3CGEnbaRenRTBRPb2nMd+wY8W
         jODkLNwyRoK91YwxAQGL6CH9SEbxftvkciDTcD0xldb5JWP93fc3wk+JP5P1QwJHEJLU
         l1cmZkMC5h8FPRX3LwxCOnVHTZ9zCdVwT268dd3bb2N6muHH1zkDPL7SjJRq2Dz9WRUm
         bGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733424858; x=1734029658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47fbT02VGMzZMhx7Sp5S8kr/f4uVejY30NijTPy/sD0=;
        b=A0xKo3c4ewmLtDINyqxfiGIfXhzUu/+3qBP1VoNm4Rgpr/khToBACzILM2vDyfB3rD
         m6IFeCt9UhWhhMnnf40bRXPm4Mry0oS2UdzIVDoCs5SYQuViCdXvJkIaGUiF06Zsd+8w
         MXLmQy1ZpGrqjk+XMJHU14ZjeGYAewXkzkmdfdz76sMhxUv3MT5nA/zwiore6O7DSwyR
         jEPD31S/GmYMuPJnhNtYGem4vjc0nCkcqFE1gDJ/M+TeDrKvRxguqiqS2OGlEybBG79Q
         npfr02Lfa/wgQE29wAxN81EoRxRSvS/afJAa1QyCw/H+Q1IecQhocuOppNzbv0aeW90a
         eVMA==
X-Forwarded-Encrypted: i=1; AJvYcCWSvT8i65DnMf0UkqtTHwTbSFTCKTdC3qndXj1HJTXmC4159+M0whY8LAYJzOFbExVp9qZcKK+TkLN4ntzkGw==@kernel.org
X-Gm-Message-State: AOJu0Yy8WHvKZgff4apLOxpnQFy7kuPX8H6nL9VJRgIjx3MBHiDfx5yj
	Yvs4kJViIcqdlrIKN7oLhEh8OBwhMyLIHbIjhSavfpIgsRPThYguNSQCVBd6Jt0=
X-Gm-Gg: ASbGncsmZ6pqbNxGnvdjGpb7MxRd3pJEQKnn3VbnUgndNdl2zJuexHRVTqSDRiYbgc8
	jWKGgpU00paeoFXUs63GPlK2YEbua7HbkiNMRzMpEGFJg/Gh4ZHEYIJceQ2qqL0H3MxwfbItJGS
	kKkzf7SAWOo2WiQvIXgIWD+UDZ0IJ0CJz4FB164cpnuerj1mCD0lwesDqR3k1nSedUMryMqnJYJ
	ibjocOIlhGNs9pvEu4x2StD2tk1prXa56+3J+8UPvmYlhwbs8Y6mfeGSANmyOkPSBj7N0wTFNxW
	+I2tAiOXGE0C8uHv1nBTx1DzLtMRmg==
X-Google-Smtp-Source: AGHT+IED/Vr5/Sy+A+9EN05PmoCzzlii1h9N7nxlqAl/Rk6vggOMlX90C1a0RWzMhJGMHIgKS9+WsQ==
X-Received: by 2002:ac2:4c4d:0:b0:53e:284a:70eb with SMTP id 2adb3069b0e04-53e2c2eb6d5mr8067e87.38.1733424858012;
        Thu, 05 Dec 2024 10:54:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229ba6f1sm307481e87.149.2024.12.05.10.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 10:54:16 -0800 (PST)
Date: Thu, 5 Dec 2024 20:54:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, 
	"Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, "quic_zhgao@quicinc.co" <quic_zhgao@quicinc.com>, 
	linux-arm-msm@vger.kernel.org
Subject: Re: add venus firmware file for qcs615
Message-ID: <kmshkjf6dqegudrnp6yjuw6hsav5fopaub46zjv256ixpgf75w@l55eswawscif>
References: <CAA8EJpoDXKbF5cqb_vzE28zjdC6OC66Zxb5j030QXaCe+FUmfw@mail.gmail.com>
 <egdqhgdiqqny57yiauiyekcvhxvebfttyncqoazslzjprwvakz@txvy7wn4vg7g>
 <a259c98c-6c77-1c1e-e428-41c2550f7517@quicinc.com>
 <pukoimsqhck5oymirmgiwad6s3l6frt7xbahp7juhvj3rt4622@wpajx6vyw5nl>
 <rukxa3h72trvqvu6wkxmkp33entybcvxfjlpcjh7odipwds6lq@rt6ferue5nbr>
 <5170f77f-c5d3-02f1-8deb-5d00fef7627a@quicinc.com>
 <magmzevx4cisi5s2ytdtzsqr6klrt6wot6cex3zpxugjspdwyt@qpooycw4b2bs>
 <41f0ebb2-02b9-a83d-6a7d-3dd03fccb687@quicinc.com>
 <cjbdqixxxu2zrgkakcb44jnkeoktwc3vmtqauejnxjxtycqtnp@7cthmlpy5qx3>
 <a730c66a-3969-3101-1ebe-88baf6184d2e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a730c66a-3969-3101-1ebe-88baf6184d2e@quicinc.com>

On Mon, Dec 02, 2024 at 08:51:15PM +0530, Vikash Garodia wrote:
> 
> On 12/2/2024 8:41 PM, Dmitry Baryshkov wrote:
> > On Mon, Dec 02, 2024 at 06:20:40PM +0530, Vikash Garodia wrote:
> >>
> >> On 12/2/2024 6:16 PM, Dmitry Baryshkov wrote:
> >>> On Mon, Dec 02, 2024 at 05:30:55PM +0530, Vikash Garodia wrote:
> >>>> Hi Dmitry,
> >>>>
> >>>> On 11/29/2024 8:05 PM, Dmitry Baryshkov wrote:
> >>>>> On Wed, Nov 20, 2024 at 01:22:50PM +0200, Dmitry Baryshkov wrote:
> >>>>>> On Wed, Nov 20, 2024 at 04:40:51PM +0530, Vikash Garodia wrote:
> >>>>>>>
> >>>>>>> On 11/20/2024 4:09 PM, Dmitry Baryshkov wrote:
> >>>>>>>> On Thu, Nov 14, 2024 at 01:31:14PM +0200, Dmitry Baryshkov wrote:
> >>>>>>>>> On Thu, 14 Nov 2024 at 13:05, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> On 11/14/2024 4:16 PM, Dmitry Baryshkov wrote:
> >>>>>>>>>>> On Thu, Nov 14, 2024 at 09:06:55AM +0530, Vikash Garodia wrote:
> >>>>>>>>>>>>
> >>>>>>>>>>>> On 11/13/2024 8:10 PM, Dmitry Baryshkov wrote:
> >>>>>>>>>>>>> On Wed, Nov 13, 2024 at 10:50:44AM +0000, Renjiang Han (QUIC) wrote:
> >>>>>>>>>>>>>> Hello
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> are available in the Git repository at:
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git<mailto:git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git> video-firmware-qcs615
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 +0530)
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> ----------------------------------------------------------------
> >>>>>>>>>>>>>> Renjiang Han (1):
> >>>>>>>>>>>>>>       qcom: venus-5.4: add venus firmware file for qcs615
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> WHENCE                      |   1 +
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Could you please be more specific, what is the difference between the
> >>>>>>>>>>>>> existing file and a new file? According to the soc_vers the new file
> >>>>>>>>>>>>> supports sdm845. Should it instead replace the old firmware?
> >>>>>>>>>>>> SDM845, SC7180, qcs615 can be enabled on same firmware ideally, but due to a
> >>>>>>>>>>>> different signing for qcs615, it takes a separate bin (xxx_s6.mbn).
> >>>>>>>>>>>
> >>>>>>>>>>> Can SDM845 handle v6 signatures? It supports v5 and PSS. Or can QCS615
> >>>>>>>>>>> use v5 signatures?
> >>>>>>>>>> Infact we started with loading sc7180 firmware on qc615, video init failed. So
> >>>>>>>>>> far i have seen 2 categories in signing version for video bins, either default
> >>>>>>>>>> or v6 specific tool.
> >>>>>>>>>
> >>>>>>>>> Can firmware / security engineers actually advice us on using v5
> >>>>>>>>> firmware signatures with QCS615 _and_ with older platforms?
> >>>>>>>>> Existing venus-5.4/venus.mbn uses v3
> >>>>>>>>
> >>>>>>>> Vikash, any updates on this topic? Would it be possible to have a single
> >>>>>>>> FW image with just v5 signatures?
> >>>>>>> Not yet Dmitry. Having a followup with relevant folks this friday to understand
> >>>>>>> the signing requirements across different SOCs, hopefully will be able to add
> >>>>>>> something on this by then.
> >>>>>
> >>>>> It's been more than a week since the last email. Are there any updates?
> >>>>> I'd really like to get this sorted out before next linux-firmware
> >>>>> release, otherwise we'll be stuck with these names for the foreseeable
> >>>>> future.
> >>>> I have been chasing both the firmware and security folks to align on this. So
> >>>> far the updates are that one is signed MBNv5 and other with MBNV6, hence leading
> >>>
> >>> I think the existing firmware uses v3, not v5.
> >>>
> >>> 00001000  00 00 00 00 03 00 00 00  00 00 00 00 28 00 a0 0f  |............(...|
> >>>
> >>>
> >>>> to different set of binaries. These MBN versions of signing is defined at SOC
> >>>> level and depends on secure boot libraries used in that SOC.
> >>>> At the same time, there is an experiment to check if SC7180 can be signed with
> >>>> version used for QCS615 i.e MBNV6.
> >>>
> >>> Thanks! Are you trying that without updating the whole bootloader stack? I
> >>> think some of SC7180 devices might be EOL'd, so it might be hard to get
> >>> FW/bootloader updates.
> >> Just the firmware part, by signing it with qcs615 way, as an experiment
> >> suggested by security folks.
> > 
> > Ok, that doesn't sound like a lengthy experiment: resign the FW, boot
> > the laptop, caboom or not caboom. If I remember correctly the file that
> > you've pushed even lists sc7180 as allowed.
> its used only for qcs615.

Huh? venus_s6.mbn lists 0x6000, 0x6001, 0x6004, 0x6005, 0x6007, 0x9001
and 0x600E as soc_vers values. I think that includes sc7180.

> >>>> One query here - given that qcs615 only loads the venus_s6.mbn variant, and it
> >>>> is not enabled yet (patches in review) for video, we should be good if we
> >>>> conclude the firmware part before accepting the qcs615 enablement patches ?
> >>>
> >>> Good question. I think that depends on linux-firmware maintainer's
> >>> opinion.
> >>>
> > 

-- 
With best wishes
Dmitry
