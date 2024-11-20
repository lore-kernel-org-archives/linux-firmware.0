Return-Path: <SRS0=Oev7=SP=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670FDD63924
	for <linux-firmware@archiver.kernel.org>; Wed, 20 Nov 2024 10:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35190C4CED7; Wed, 20 Nov 2024 10:39:17 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22E12C4CECD
	for <linux-firmware@kernel.org>; Wed, 20 Nov 2024 10:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 22E12C4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53da3b911b9so6155940e87.2
        for <linux-firmware@kernel.org>; Wed, 20 Nov 2024 02:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732099154; x=1732703954; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WDF8E3m2N7Vk+a4YnA2jlyfjSe+DimbeOLxWBc4oAvg=;
        b=MWS15x9/N4qc3jiHPOhimtvCJ8KGeJeuqTtibr/P0POkEa0F+FuNugA6fPtF0K7tnX
         vU1HB7pU6CkLd66GN1j2bZDVdVqY4lc/lGNLRi7BVyn6iVRy6w6ewe1f4x+CPa+lWuAR
         uNRkmsKWFb2FUUeX1opFEgkmWvCmPXaj64a+rhb9kie9bXo3nNXPl3xUsny2OwEkJHhw
         wVIuqFKFdhD7BZwy970+6iRucxKxQnEH3P9LY0Se2Z2bulpJ/Ne6uHKPkt7sS/40GU3M
         Dw8jjQN+vHrGKZAapYP6dp9xiICNxeYU54KgdFa6RcCKEay6HKHZqjWlMuPzDTeznb18
         HIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732099154; x=1732703954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDF8E3m2N7Vk+a4YnA2jlyfjSe+DimbeOLxWBc4oAvg=;
        b=JbXz3fNsWHDrE8Lm6wu6Dpu9KDBVgnL6X8RyN6NcXfYOg4UvmIhyzBGlP89zvr3m6t
         hmPL76Qne23HxjbWvaZ1D0iby+yzIqxIsBtYgqSj8KW7cgJoTHKG01h4d78SbElkmCwF
         avqcDWi6HLNlMzZhSiVOE7SWkwN4fFFK0ohUUl6daeAPO+3Yb7vErWsUzurIXSoQIbju
         71t+gsO5YYfYImEZOrKkF2lsiqhU1CFz7DmPzieUDaNwsiQ7VBK4+zPWu0/dFb/7C49O
         pOs5skh2Re1gIn8fxFt24/lBfJ11m8ad6ewBDpRkwh5nshNDRfcLVOuF9zq7XeKQJNin
         HrSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCIivUvGvfCh8Io8FiYotbx1ah3JpHiopn6gWFZl3kSyPOGOrwciRaatgApsUc4wI6DPNEdEOuroEwOqz8vw==@kernel.org
X-Gm-Message-State: AOJu0YyvtHOf0KD2IO0bSnNRRhGwE8Goj0ULK5UNgX2IA8LrSxiRKZSA
	+/UzSn1r8RmE1P5lSh5l2odQV/xw+ScJ6vlIxZrGD8qn1bcIzqK0jaV/2VvV1hU=
X-Google-Smtp-Source: AGHT+IH3Vlowq6qX83zYFQ1wyc4wpGbDrW8lYoEpxuvci2lGDIPGfxROFI0K+RJ6ElitxENmM7S/TA==
X-Received: by 2002:a05:6512:3b24:b0:53d:c062:b5b7 with SMTP id 2adb3069b0e04-53dc136739dmr996939e87.42.1732099154281;
        Wed, 20 Nov 2024 02:39:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd3fd036sm584336e87.111.2024.11.20.02.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 02:39:12 -0800 (PST)
Date: Wed, 20 Nov 2024 12:39:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, 
	"Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, "quic_zhgao@quicinc.co" <quic_zhgao@quicinc.com>, 
	linux-arm-msm@vger.kernel.org
Subject: Re: add venus firmware file for qcs615
Message-ID: <egdqhgdiqqny57yiauiyekcvhxvebfttyncqoazslzjprwvakz@txvy7wn4vg7g>
References: <83153c5ab8374e008d62646f200f9a04@quicinc.com>
 <ng4o7sdejoh4jn4nnarjd4lio4lbx2tiuiz5c6bigjbtxldinr@xl5wx6dmdivy>
 <ab4f83c1-5cd6-a80b-fd85-ccc337c8f301@quicinc.com>
 <pqoq64hk2jedmqta5fs4ktcadw4getwkgz324vtrzzotcurpaw@zc6dlhbqtsnz>
 <a1bbc1d0-d3bd-e44e-e393-a7ade909a506@quicinc.com>
 <CAA8EJpoDXKbF5cqb_vzE28zjdC6OC66Zxb5j030QXaCe+FUmfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoDXKbF5cqb_vzE28zjdC6OC66Zxb5j030QXaCe+FUmfw@mail.gmail.com>

On Thu, Nov 14, 2024 at 01:31:14PM +0200, Dmitry Baryshkov wrote:
> On Thu, 14 Nov 2024 at 13:05, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
> >
> >
> > On 11/14/2024 4:16 PM, Dmitry Baryshkov wrote:
> > > On Thu, Nov 14, 2024 at 09:06:55AM +0530, Vikash Garodia wrote:
> > >>
> > >> On 11/13/2024 8:10 PM, Dmitry Baryshkov wrote:
> > >>> On Wed, Nov 13, 2024 at 10:50:44AM +0000, Renjiang Han (QUIC) wrote:
> > >>>> Hello
> > >>>>
> > >>>> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
> > >>>>
> > >>>>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> > >>>>
> > >>>> are available in the Git repository at:
> > >>>>
> > >>>>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git<mailto:git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git> video-firmware-qcs615
> > >>>>
> > >>>> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
> > >>>>
> > >>>>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 +0530)
> > >>>>
> > >>>> ----------------------------------------------------------------
> > >>>> Renjiang Han (1):
> > >>>>       qcom: venus-5.4: add venus firmware file for qcs615
> > >>>>
> > >>>> WHENCE                      |   1 +
> > >>>
> > >>> Could you please be more specific, what is the difference between the
> > >>> existing file and a new file? According to the soc_vers the new file
> > >>> supports sdm845. Should it instead replace the old firmware?
> > >> SDM845, SC7180, qcs615 can be enabled on same firmware ideally, but due to a
> > >> different signing for qcs615, it takes a separate bin (xxx_s6.mbn).
> > >
> > > Can SDM845 handle v6 signatures? It supports v5 and PSS. Or can QCS615
> > > use v5 signatures?
> > Infact we started with loading sc7180 firmware on qc615, video init failed. So
> > far i have seen 2 categories in signing version for video bins, either default
> > or v6 specific tool.
> 
> Can firmware / security engineers actually advice us on using v5
> firmware signatures with QCS615 _and_ with older platforms?
> Existing venus-5.4/venus.mbn uses v3

Vikash, any updates on this topic? Would it be possible to have a single
FW image with just v5 signatures?

-- 
With best wishes
Dmitry
