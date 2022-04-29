Return-Path: <SRS0=Z/R0=VH=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426DEC433EF
	for <linux-firmware@archiver.kernel.org>; Fri, 29 Apr 2022 06:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 05820C385A4; Fri, 29 Apr 2022 06:12:43 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0F119C385A7
	for <linux-firmware@kernel.org>; Fri, 29 Apr 2022 06:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0F119C385A7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-2f7ca2ce255so75067067b3.7
        for <linux-firmware@kernel.org>; Thu, 28 Apr 2022 23:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JnXNRi3fgLseToL8emPAro3wD9fV8AutKcOTldnUHZg=;
        b=hlwtoZX5S8WE5hujcH3ZqSI1F6JaTPn+asutbPJcQCC2bbL5Kfg3Kg6RR0129B5hGJ
         0s0RPL0CYx/63UTzOvYhq6RBlIHCPY6i0WBpSXW6Y5CMbZAf0GkRCWsJFKgHUYb098et
         TZetDO80SdCHicgzkOGFwZecll7xmToAqGL1wJ+sLVf15/mMApvnCoR9qol0ahu36Iij
         IgHog0xdtRcxjG5RIu/lCjhIIggH2lzrKqsH+KQ67RF8nR9cSV8ZJ7JpkWod6jHGyJIl
         1Q2tHzNgW0wVgUJL8ydgUrWE+zASpoKSuyhmU6rilGsVZuyGCIEtpDXbuyDuEwYiwquW
         7/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JnXNRi3fgLseToL8emPAro3wD9fV8AutKcOTldnUHZg=;
        b=dFtRu9MUeTRhwvrf7/rii5hGiEvYyd8kIAhxAChtZ6iOZlDo4U/sWTMIF8FLGtl+T0
         6JyDQBQxFqBNf4eXkqW/dKYNq+CQjT3/HCtLRcaISKUA0HAZgImUjp42tDycLGxMhR0D
         Ii5hW+GnmkH7jOhnXeXWRUKr7cnKQTQ4U/S8WF2tYKwuWeZaiabG5fU//FFgF5+Lfky9
         tGGY+xtTlsuw1c9ErGuToAPxGks4Ml3zWNlolp5prDbftaCY5ENNbBk38ZpmG/9QJRyk
         a1vakXjIi/Q3QHmug7ouow7uET3/ZFBSASO6KFs6ZMjpB7NHu8D/zr12bqcFEyVhpP1s
         puWg==
X-Gm-Message-State: AOAM530YLsRpw4zOG/cS3xF8I1Gh0oXo2xYn0LUBv/6cELsGAyawXGDg
	PDfYr9UZh6DPb/9rZFc4z7Xtc3J/8rElIMGqQS0R1g==
X-Google-Smtp-Source: ABdhPJydCw7QruBmFPtNS1LGkkCjRGaFOawi7x7UIiIhGh/L6he7e8pCGYsHIflNa7QBcza34vr14ezR92EiO4/ypPo=
X-Received: by 2002:a81:492:0:b0:2f7:ce87:c324 with SMTP id
 140-20020a810492000000b002f7ce87c324mr28911207ywe.359.1651212760038; Thu, 28
 Apr 2022 23:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR02MB4567E377F14F272DFF48907A92FA9@BYAPR02MB4567.namprd02.prod.outlook.com>
 <332e62e5-b04d-3a6a-38fe-924d056bf0f8@linaro.org> <87k0b8fnpj.fsf@kernel.org>
In-Reply-To: <87k0b8fnpj.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Apr 2022 09:12:28 +0300
Message-ID: <CAA8EJpr3Uxa-Tif5TyHfXL03j1--vrAb+DgT=0DY8KDpvHPjeQ@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20220423
To: Kalle Valo <kvalo@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, 
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Apr 2022 at 08:44, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > Hi Kalle,
> >
> > On 27/04/2022 11:32, Kalle Valo wrote:
> >> Add support for QCN9074 and WCN6750 ath11k hardware families. Also
> >> there are several updates to existing firmwares and board files for both ath10k
> >> and ath11k.
> >>
> >> Please let me know if there are any problems.
> >
> > I noticed that this pull request doesn't include the board file for
> > WCN3990. Is there any issue with it that we can solve on our side?
>
> Oh, sorry about that. I guess this is just a bug in my scripts, I'll
> include the wcn3990 board file in the next pull request.

Thank you! No problem, it was more of a question if we missed something.

> Linux firmware maintainers, please pull this anyway. I'll submit a
> follow up pull request later.


-- 
With best wishes
Dmitry
