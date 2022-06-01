Return-Path: <SRS0=LrQQ=WI=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AADC433EF
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Jun 2022 10:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E778FC385A5; Wed,  1 Jun 2022 10:34:58 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 373A2C385B8
	for <linux-firmware@kernel.org>; Wed,  1 Jun 2022 10:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 373A2C385B8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f177.google.com with SMTP id x7so827408qta.6
        for <linux-firmware@kernel.org>; Wed, 01 Jun 2022 03:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AX1aU92WNtfdOkIt5sxzsSkaDvk1+o93dreOm4oGYGk=;
        b=MpHJ6ZZ+VY6LYh2Tbdy+UL75aLbwI+CBqbg8hdrtFQNmpeG9/j1cgb79l8nkNg/oWZ
         S5P00PFcOTyEBHx3245sZsgKdLXx46LI328Xmw8Wc0jbr318yNAwgiRAJjCMuzi9UniD
         ysuUiaiseboWAV3ANBCCwvS2RDvPZqYV3mGkQ4ieNctvI4SBEE0cGuQezTDazDxa9r7n
         jFA9p9yFbLgD6p+PnSB65+clN+etJVe7BZTN4yDoJK6efgqPUqc396RNFmr8hX7njBJQ
         nSxYfFfx4+WTyDERQrLw96Ez4crrUu/2IyekAhWxd7nPB545KMGy8oqheoTF/h/OUQJ8
         T+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AX1aU92WNtfdOkIt5sxzsSkaDvk1+o93dreOm4oGYGk=;
        b=ezuGI1UXm3UYZMz19csEtkYh7cyCqu1uc2rhqvDxHqR0JKyIVthdvDVX/VYkMQMQXB
         4c0lqeB1HsCLpSee2DbWj/X9Ido9dq4NQdH7VMXDNCSDNr5ydZo6Fl+OwQ5v1ELBUdE5
         gsd8WtVLJYVhLjTF+naK6uzZma+LH40FPc1ztiQVPre7jaQw50Ah8C1KQ9OXwyAc+ntl
         t3AsqiVqZMa+VlEg1fquJrV+JWVagGjow0ZGRO/rzrdtAWFIXVPon3OxFHcpuBO59wsn
         ++U2SfCQD4LHe+iRbtSNW3RlnPEbIubQMXjGWRM0704kZzMhYG1PRHU6QvNJCeGnvQK8
         jhzg==
X-Gm-Message-State: AOAM533hZtAXVlnVp8P3XiptAYb7h8PgNUqsQdr2LJh61VOESUZdU5yq
	/Fs0qspVAx3EmQFfaUcpH6Hcn/RBeQdMty2Rtt36nA==
X-Google-Smtp-Source: ABdhPJyxtzlXZmOy66yFMqw6hawHCM74kzO8BgZgrPRFgx/TQPeT2PGwJX08xXjicyp+Dem9JsTuXFxZ0el5Ho78CrA=
X-Received: by 2002:ac8:5990:0:b0:304:c8d6:3147 with SMTP id
 e16-20020ac85990000000b00304c8d63147mr419347qte.370.1654079696073; Wed, 01
 Jun 2022 03:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR02MB4567E377F14F272DFF48907A92FA9@BYAPR02MB4567.namprd02.prod.outlook.com>
 <332e62e5-b04d-3a6a-38fe-924d056bf0f8@linaro.org> <87k0b8fnpj.fsf@kernel.org>
 <CAA8EJpr3Uxa-Tif5TyHfXL03j1--vrAb+DgT=0DY8KDpvHPjeQ@mail.gmail.com> <87r148opbm.fsf@kernel.org>
In-Reply-To: <87r148opbm.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 1 Jun 2022 13:34:44 +0300
Message-ID: <CAA8EJpqj57v6yetGLHHi-xZocsGfAyPfdHZFV4wZ+Cpz2XaRvg@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20220423
To: Kalle Valo <kvalo@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, 
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Jun 2022 at 09:44, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > On Fri, 29 Apr 2022 at 08:44, Kalle Valo <kvalo@kernel.org> wrote:
> >>
> >> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> >>
> >> > Hi Kalle,
> >> >
> >> > On 27/04/2022 11:32, Kalle Valo wrote:
> >> >> Add support for QCN9074 and WCN6750 ath11k hardware families. Also
> >> >> there are several updates to existing firmwares and board files for both ath10k
> >> >> and ath11k.
> >> >>
> >> >> Please let me know if there are any problems.
> >> >
> >> > I noticed that this pull request doesn't include the board file for
> >> > WCN3990. Is there any issue with it that we can solve on our side?
> >>
> >> Oh, sorry about that. I guess this is just a bug in my scripts, I'll
> >> include the wcn3990 board file in the next pull request.
> >
> > Thank you! No problem, it was more of a question if we missed something.
>
> It was pulled now:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=86f0c5642c4c06583fccce8e03ca400300330cba
>
> Do let me know if there's anything missing or wrong.

The board file looks fine to me. Thanks a lot!

-- 
With best wishes
Dmitry
