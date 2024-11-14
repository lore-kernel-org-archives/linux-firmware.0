Return-Path: <SRS0=YLXH=SJ=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04943D65C79
	for <linux-firmware@archiver.kernel.org>; Thu, 14 Nov 2024 11:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C60C9C4CECD; Thu, 14 Nov 2024 11:31:22 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 91350C4CECF
	for <linux-firmware@kernel.org>; Thu, 14 Nov 2024 11:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 91350C4CECF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6eb0e90b729so6395897b3.1
        for <linux-firmware@kernel.org>; Thu, 14 Nov 2024 03:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731583880; x=1732188680; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9PUKRCePQxyjlwnWlBc3GAU2sYsTn18U7MQXC4Mlzzk=;
        b=hP4YeYXt99PJZSjKb0PuTd5AMmOB0bpJih1Ry5+GkXuo0GhUfnfi4iDIrw21+PSvsF
         +/0Cvsikpxl5BtLQY4PV3UmtQD/Xn+qYrJsTVwBrduV7OEYuWQt1u2ZeBD/1JEad3RR6
         BGJPSglRKxXA6VEw3wo9nG8wTQbw1NP88TNyKM/va2lXX7iOwAem1uyDUNTibbMiPyeS
         MB/ECbq+5YLRKLmfoPP18xl4lZqQcKEAihj374c/1zJS+/Y1vzwxmwV7iytx/G+p04li
         RlGkKVFhnqurUM6zp75VQw1hBA8T5h2PrrB7O/D1mFHt36KuZiq5wYsuGul8KJbclOhL
         8cPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731583880; x=1732188680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9PUKRCePQxyjlwnWlBc3GAU2sYsTn18U7MQXC4Mlzzk=;
        b=CrCtAM1BYcCwZDqJKkOvL1wK1I0HXtxTQKx/PdpQpMzsD4Q7tgOkjxYIus/ILL/nFl
         LJQfmgJPKA/vivbf5iZJhA0/mnqM/NS/XvHSnwAtVzDZmypG3ZJuklNZXwR29S5mXhpM
         5LF2RsaX9b7X4EQxP1nMrBFQ8ZUwvwA3y9BkC5cgFEwv7jBPhnF3wo0eUMynjXy70jPF
         jzVPJtciVa4uM3KOEgUn2tDRmNq9hz61HUQXuREK+3wM+C+02EB6/KyMru1r0e+5kDmS
         YF9HjXueKU0+7J1rvDLAE1Ph5gHycHlquczVIeDdKN/NEvfMMW+CeDABQGrytURVFr6V
         MonA==
X-Forwarded-Encrypted: i=1; AJvYcCW67dfVHx1VV1FZE85iOaqm6kb3198icwxtuxNPhKq/9pdKiiWIhjIclMhRxNQYpJFx3q9MExBG9eFRCC0z6A==@kernel.org
X-Gm-Message-State: AOJu0YzJ/vBKCMhcDb6NEhnlaouxqSyHjJioMYrRTPsDiEFVTc5tpBtf
	uSw1ZIMbBc20HPZNfBlcOkX5rF5V2tuH6/ovYeNP1UUmB+JUAZYbMWGTr50OhMT+XUn8x3YrYl/
	d6qT6fVn0dgb+dpelxOfbVxUGKkBD9Ay+udRylA==
X-Google-Smtp-Source: AGHT+IHyKg1Jw7I0bOCjudUOhlRkriBkABFKQeim2vJrcv932AJ93Cqf8uVYNM1OVMyCx9XM/iw4Gs9/qcc1V6VLDEk=
X-Received: by 2002:a05:690c:6408:b0:6ea:4e1f:2b39 with SMTP id
 00721157ae682-6ee4333ecebmr16935097b3.4.1731583880470; Thu, 14 Nov 2024
 03:31:20 -0800 (PST)
MIME-Version: 1.0
References: <83153c5ab8374e008d62646f200f9a04@quicinc.com> <ng4o7sdejoh4jn4nnarjd4lio4lbx2tiuiz5c6bigjbtxldinr@xl5wx6dmdivy>
 <ab4f83c1-5cd6-a80b-fd85-ccc337c8f301@quicinc.com> <pqoq64hk2jedmqta5fs4ktcadw4getwkgz324vtrzzotcurpaw@zc6dlhbqtsnz>
 <a1bbc1d0-d3bd-e44e-e393-a7ade909a506@quicinc.com>
In-Reply-To: <a1bbc1d0-d3bd-e44e-e393-a7ade909a506@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Nov 2024 13:31:14 +0200
Message-ID: <CAA8EJpoDXKbF5cqb_vzE28zjdC6OC66Zxb5j030QXaCe+FUmfw@mail.gmail.com>
Subject: Re: add venus firmware file for qcs615
To: Vikash Garodia <quic_vgarodia@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, 
	"quic_zhgao@quicinc.co" <quic_zhgao@quicinc.co>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Nov 2024 at 13:05, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
>
>
> On 11/14/2024 4:16 PM, Dmitry Baryshkov wrote:
> > On Thu, Nov 14, 2024 at 09:06:55AM +0530, Vikash Garodia wrote:
> >>
> >> On 11/13/2024 8:10 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Nov 13, 2024 at 10:50:44AM +0000, Renjiang Han (QUIC) wrote:
> >>>> Hello
> >>>>
> >>>> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
> >>>>
> >>>>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> >>>>
> >>>> are available in the Git repository at:
> >>>>
> >>>>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git<mailto:git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git> video-firmware-qcs615
> >>>>
> >>>> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
> >>>>
> >>>>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 +0530)
> >>>>
> >>>> ----------------------------------------------------------------
> >>>> Renjiang Han (1):
> >>>>       qcom: venus-5.4: add venus firmware file for qcs615
> >>>>
> >>>> WHENCE                      |   1 +
> >>>
> >>> Could you please be more specific, what is the difference between the
> >>> existing file and a new file? According to the soc_vers the new file
> >>> supports sdm845. Should it instead replace the old firmware?
> >> SDM845, SC7180, qcs615 can be enabled on same firmware ideally, but due to a
> >> different signing for qcs615, it takes a separate bin (xxx_s6.mbn).
> >
> > Can SDM845 handle v6 signatures? It supports v5 and PSS. Or can QCS615
> > use v5 signatures?
> Infact we started with loading sc7180 firmware on qc615, video init failed. So
> far i have seen 2 categories in signing version for video bins, either default
> or v6 specific tool.

Can firmware / security engineers actually advice us on using v5
firmware signatures with QCS615 _and_ with older platforms?
Existing venus-5.4/venus.mbn uses v3

>
> Regards,
> Vikash
> >
> >>
> >> Regards,
> >> Vikash
> >>>
> >>>> qcom/venus-5.4/venus_s6.mbn | Bin 0 -> 922240 bytes
> >>>> 2 files changed, 1 insertion(+)
> >>>> create mode 100644 qcom/venus-5.4/venus_s6.mbn
> >>>>
> >>>> Best Regards,
> >>>> Renjiang
> >>>
> >



-- 
With best wishes
Dmitry
