Return-Path: <SRS0=ZFKN=TF=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFD0E7717F
	for <linux-firmware@archiver.kernel.org>; Thu, 12 Dec 2024 08:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3AA8C4CED3; Thu, 12 Dec 2024 08:35:55 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B0546C4CECE
	for <linux-firmware@kernel.org>; Thu, 12 Dec 2024 08:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B0546C4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ef7640e484so3594677b3.3
        for <linux-firmware@kernel.org>; Thu, 12 Dec 2024 00:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733992553; x=1734597353; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4TkY39P+vlg/i8AAoYjstBMabSFiAC3xgwzVs9yVaM=;
        b=dRPRWzj/x2wQ9RGJHxHePt2Xa9fmwZwbAzennkrRSIr6cKiyb3MYVvf35W99l2fadW
         JD6UMkP89V6MWOjy5bJsxuUHGRQFfoSKYcHFUor31pfGVOJIIehp9BiCLQEo2sOWgq98
         89QsO6ChZjD2YKiF8GrixIlAODVpeecwn48aNcSJPHUyoCm1GcYxblTi7vrYMFNRhzJg
         9MjZGZ32IQ2BGMHwOxk10vljpskXRNPh6P51JglNuh5g+0hC0oVBWJ3TIsI0EfbpXjUI
         +MMDc827clxEb1WGt76++WemXsmtOIS/Mp0KoMpB/10N3u8WTuci8wnP1iIgsh5pW8OT
         jP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733992553; x=1734597353;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4TkY39P+vlg/i8AAoYjstBMabSFiAC3xgwzVs9yVaM=;
        b=qDr1Fhtj8BBCpguGZceSdc5fcn3frPgnWM0DDSzbrf8vj0FLTC8+HjzDxZ5syinsUA
         NFG+/KN20/w5A206as11LyVvl5vmYZNItRNbP0aNtB6IK/Y5OHBdFSTw9OGmt/8Crkpe
         CN8+Rt08jtGc6kbO/FPCIhFSm3EILhJrTiJlqXo7b1Jx1XgD0XKmQRDV0+xYSg9lw6Cx
         UutU4IIA25+UK16NLa29WNrdn6vGgKanLf1HT8o7ZHf9mcDbrTihEnlxRvtVE17i+7ss
         ye2B14jVnk9nqUXMCPNFcozxfyMydYamnA7MGp5TG8GJrS7/P+LxzFeNYOsBzZGhAuk1
         RM9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCui8zPed1keUg5MfccPci0dUu7z6T5SuF9E7bOblbe5K9kWqPWHNzlrZVKCabSMFpfRsO1oeg8tMDXuqlhw==@kernel.org
X-Gm-Message-State: AOJu0Yy+AShZgMry/7wzsQkqdI1WZRO0dRj60kg3J5ax1JZ3FkReodsq
	BNIjWQhJmUbuaKyGum66MM0fWq5Kqo8SIVrvTATKDi2n1jjSXPqP35ekVusP/MOOJLe2emW0Xsr
	BAGn/SQsr+EfGQEuIDqL5DUlSkn3/yvF/NJroQA==
X-Gm-Gg: ASbGnct1qcVdqowJY9zvjO0Iqz4HkmPmOzfw9UZDqr0qZR7gtq33qOBT9FFOr0X8jJ8
	fvDUQTU9nIn7zJyfiNhkhDC8lrXIrKZ8wvbuoNw==
X-Google-Smtp-Source: AGHT+IFvM81bKMQZqpQKs+yV21MrdBwomhfPghfgIQlB2pFu3Zgm60ERVrllI9akG7YY9Pn8fdWh1yxbF0Os2FhnUdY=
X-Received: by 2002:a05:690c:4c06:b0:6ef:710d:db34 with SMTP id
 00721157ae682-6f198a3b42emr18316177b3.5.1733992552697; Thu, 12 Dec 2024
 00:35:52 -0800 (PST)
MIME-Version: 1.0
References: <pqoq64hk2jedmqta5fs4ktcadw4getwkgz324vtrzzotcurpaw@zc6dlhbqtsnz>
 <a1bbc1d0-d3bd-e44e-e393-a7ade909a506@quicinc.com> <CAA8EJpoDXKbF5cqb_vzE28zjdC6OC66Zxb5j030QXaCe+FUmfw@mail.gmail.com>
 <egdqhgdiqqny57yiauiyekcvhxvebfttyncqoazslzjprwvakz@txvy7wn4vg7g>
 <a259c98c-6c77-1c1e-e428-41c2550f7517@quicinc.com> <pukoimsqhck5oymirmgiwad6s3l6frt7xbahp7juhvj3rt4622@wpajx6vyw5nl>
 <rukxa3h72trvqvu6wkxmkp33entybcvxfjlpcjh7odipwds6lq@rt6ferue5nbr>
 <5170f77f-c5d3-02f1-8deb-5d00fef7627a@quicinc.com> <magmzevx4cisi5s2ytdtzsqr6klrt6wot6cex3zpxugjspdwyt@qpooycw4b2bs>
 <41f0ebb2-02b9-a83d-6a7d-3dd03fccb687@quicinc.com> <cjbdqixxxu2zrgkakcb44jnkeoktwc3vmtqauejnxjxtycqtnp@7cthmlpy5qx3>
 <a730c66a-3969-3101-1ebe-88baf6184d2e@quicinc.com> <a589d8b2-5d2e-c13d-9251-c18e1040407a@quicinc.com>
In-Reply-To: <a589d8b2-5d2e-c13d-9251-c18e1040407a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 10:35:43 +0200
Message-ID: <CAA8EJpoyBdm=w9_atgTaibscOWoL6tUt95Yet7oKcKUtkDy_rg@mail.gmail.com>
Subject: Re: add venus firmware file for qcs615
To: Vikash Garodia <quic_vgarodia@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	"Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, 
	"quic_zhgao@quicinc.co" <quic_zhgao@quicinc.com>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Dec 2024 at 10:22, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
>
>
> On 12/2/2024 8:51 PM, Vikash Garodia wrote:
> >
> > On 12/2/2024 8:41 PM, Dmitry Baryshkov wrote:
> >> On Mon, Dec 02, 2024 at 06:20:40PM +0530, Vikash Garodia wrote:
> >>>
> >>> On 12/2/2024 6:16 PM, Dmitry Baryshkov wrote:
> >>>> On Mon, Dec 02, 2024 at 05:30:55PM +0530, Vikash Garodia wrote:
> >>>>> Hi Dmitry,
> >>>>>
> >>>>> On 11/29/2024 8:05 PM, Dmitry Baryshkov wrote:
> >>>>>> On Wed, Nov 20, 2024 at 01:22:50PM +0200, Dmitry Baryshkov wrote:
> >>>>>>> On Wed, Nov 20, 2024 at 04:40:51PM +0530, Vikash Garodia wrote:
> >>>>>>>>
> >>>>>>>> On 11/20/2024 4:09 PM, Dmitry Baryshkov wrote:
> >>>>>>>>> On Thu, Nov 14, 2024 at 01:31:14PM +0200, Dmitry Baryshkov wrote:
> >>>>>>>>>> On Thu, 14 Nov 2024 at 13:05, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> On 11/14/2024 4:16 PM, Dmitry Baryshkov wrote:
> >>>>>>>>>>>> On Thu, Nov 14, 2024 at 09:06:55AM +0530, Vikash Garodia wrote:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> On 11/13/2024 8:10 PM, Dmitry Baryshkov wrote:
> >>>>>>>>>>>>>> On Wed, Nov 13, 2024 at 10:50:44AM +0000, Renjiang Han (QUIC) wrote:
> >>>>>>>>>>>>>>> Hello
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> are available in the Git repository at:
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git<mailto:git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git> video-firmware-qcs615
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 +0530)
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> ----------------------------------------------------------------
> >>>>>>>>>>>>>>> Renjiang Han (1):
> >>>>>>>>>>>>>>>       qcom: venus-5.4: add venus firmware file for qcs615
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> WHENCE                      |   1 +
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Could you please be more specific, what is the difference between the
> >>>>>>>>>>>>>> existing file and a new file? According to the soc_vers the new file
> >>>>>>>>>>>>>> supports sdm845. Should it instead replace the old firmware?
> >>>>>>>>>>>>> SDM845, SC7180, qcs615 can be enabled on same firmware ideally, but due to a
> >>>>>>>>>>>>> different signing for qcs615, it takes a separate bin (xxx_s6.mbn).
> >>>>>>>>>>>>
> >>>>>>>>>>>> Can SDM845 handle v6 signatures? It supports v5 and PSS. Or can QCS615
> >>>>>>>>>>>> use v5 signatures?
> >>>>>>>>>>> Infact we started with loading sc7180 firmware on qc615, video init failed. So
> >>>>>>>>>>> far i have seen 2 categories in signing version for video bins, either default
> >>>>>>>>>>> or v6 specific tool.
> >>>>>>>>>>
> >>>>>>>>>> Can firmware / security engineers actually advice us on using v5
> >>>>>>>>>> firmware signatures with QCS615 _and_ with older platforms?
> >>>>>>>>>> Existing venus-5.4/venus.mbn uses v3
> >>>>>>>>>
> >>>>>>>>> Vikash, any updates on this topic? Would it be possible to have a single
> >>>>>>>>> FW image with just v5 signatures?
> >>>>>>>> Not yet Dmitry. Having a followup with relevant folks this friday to understand
> >>>>>>>> the signing requirements across different SOCs, hopefully will be able to add
> >>>>>>>> something on this by then.
> >>>>>>
> >>>>>> It's been more than a week since the last email. Are there any updates?
> >>>>>> I'd really like to get this sorted out before next linux-firmware
> >>>>>> release, otherwise we'll be stuck with these names for the foreseeable
> >>>>>> future.
> >>>>> I have been chasing both the firmware and security folks to align on this. So
> >>>>> far the updates are that one is signed MBNv5 and other with MBNV6, hence leading
> >>>>
> >>>> I think the existing firmware uses v3, not v5.
> >>>>
> >>>> 00001000  00 00 00 00 03 00 00 00  00 00 00 00 28 00 a0 0f  |............(...|
> >>>>
> >>>>
> >>>>> to different set of binaries. These MBN versions of signing is defined at SOC
> >>>>> level and depends on secure boot libraries used in that SOC.
> >>>>> At the same time, there is an experiment to check if SC7180 can be signed with
> >>>>> version used for QCS615 i.e MBNV6.
> >>>>
> >>>> Thanks! Are you trying that without updating the whole bootloader stack? I
> >>>> think some of SC7180 devices might be EOL'd, so it might be hard to get
> >>>> FW/bootloader updates.
> >>> Just the firmware part, by signing it with qcs615 way, as an experiment
> >>> suggested by security folks.
> >>
> >> Ok, that doesn't sound like a lengthy experiment: resign the FW, boot
> >> the laptop, caboom or not caboom. If I remember correctly the file that
> >> you've pushed even lists sc7180 as allowed.
> > its used only for qcs615.
> some good news, we could now have qcs615 firmware as common for both qcs615 as
> well as sc7180. A PR would be raised to updated 5.4/venus.mbn and at the same
> time to delete 5.4/venus_s6.mbn.

Note, 5.4/venus_s6.mbn has been included into December release, so
ideally you have to provide backwards compatible link (unless
maintainers allow you to skip one).

>
> Regards,
> Vikash
> >>
> >>>
> >>>>> One query here - given that qcs615 only loads the venus_s6.mbn variant, and it
> >>>>> is not enabled yet (patches in review) for video, we should be good if we
> >>>>> conclude the firmware part before accepting the qcs615 enablement patches ?
> >>>>
> >>>> Good question. I think that depends on linux-firmware maintainer's
> >>>> opinion.
> >>>>
> >>



-- 
With best wishes
Dmitry
