Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F00E7717F
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Dec 2024 15:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 873ECC4CED6; Tue, 17 Dec 2024 15:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F82C4CEDD
	for <linux-firmware@kernel.org>; Tue, 17 Dec 2024 15:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734450614;
	bh=/F4y2ZC9NlRypMlnvCJM6H+YDBPKLhicbA0s4R7gWZY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=t46Q5sIQYLP9H/TuM01DhnaG+Lx4BXRIUcXWuPMj0Rymg4JPH8WdyrzrXVqNBytgJ
	 adj33W2XAGgtXlBQd15PJas0XPenOP6iH3ge8fK1e8SlCQeCof8It1SbTyK3ChrmRK
	 7zpGGN3UP4a2lsH8U5Bn94AKAjdn1/AfgLEx8P5qZl/SFduhol9dQiKevlCLHviRk1
	 wMEyhK1yFXan7onfojiulhHVeKUSw+jVD86ZcO/DQmNVQOtKE90NJ4jQmpivmluZ7v
	 1doT0gOhgfFv5ZP9a/0AzpNmIfgCteRiDtOsCscJ7AjNflLeVu3WTX9MPLtKduTV22
	 qZppaeUaNGmGw==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6eff0f3306fso41729597b3.2
        for <linux-firmware@kernel.org>; Tue, 17 Dec 2024 07:50:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUS/sOcFdgKGdg1QXUbmQ0EXECx/YWu4XWS8RsPbNJ7KwIgQoCqFHlygJ3Y9S/cxofvS/lHV+WZ2SfL8nNWnQ==@kernel.org
X-Gm-Message-State: AOJu0Ywwx45BD69TUeS7WvMfq6L1KayKl+B/+a9BxUzmHFWryS/z3cBt
	+9lm69uIhcuXzU83QS+0K66gsKtrmzswYgYnRkgFGFXiIDvDHvD8wAph5QK+XzEFT/UsPIFlYmT
	DCgEIxwtdUmla+jqCj3HybX4PC/Q=
X-Google-Smtp-Source: AGHT+IF1PmXoFjIMnDLPAqE38mqGDhevTE+4YfH/jfaheW7uHIh2IdQqO54vPezJj0HPO54oRCFjAmxf9tkM9T9pa7I=
X-Received: by 2002:a05:690c:7090:b0:6ef:4fba:8143 with SMTP id
 00721157ae682-6f279b253aamr138726397b3.18.1734450613637; Tue, 17 Dec 2024
 07:50:13 -0800 (PST)
MIME-Version: 1.0
References: <6e0ae91f-7233-ca54-953e-734a71d76e22@quicinc.com>
 <CAA8EJppvAPmneYtixMhACf7NJdOX837UFuFdVCzbzBDMOSDR0Q@mail.gmail.com>
 <f2867d67-8b89-fcff-80c2-3de46806a590@quicinc.com> <CAA8EJpo+6r61Fcu-jzjdcrT6ifkmTHua5sdsuDpfZwZuo=JEBA@mail.gmail.com>
 <0a0ca412-bbf3-8411-5de1-155098b1811f@quicinc.com> <bb1b636d-8b17-6061-ecc1-8568bbd9e9bc@quicinc.com>
 <rxoicrvyx4vob3skbzrpnxfh4jk6talcn3pkkxb6pupnj3tykp@sppjerlk45ov>
 <1c7bd24f-8dda-60c0-b328-4f94e20592be@quicinc.com> <nk7v54t7smhu2xpvm5wo6nuo5onbw7texkqwbjrmftgcsxxusv@pifm7tht5h4x>
In-Reply-To: <nk7v54t7smhu2xpvm5wo6nuo5onbw7texkqwbjrmftgcsxxusv@pifm7tht5h4x>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 17 Dec 2024 10:50:02 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6Cr1x6inWYgtZtietBGDA5qq_=TDrfJuMzJ_hSn_QAjg@mail.gmail.com>
Message-ID: <CA+5PVA6Cr1x6inWYgtZtietBGDA5qq_=TDrfJuMzJ_hSn_QAjg@mail.gmail.com>
Subject: Re: update firmware binary for sc7180 and qcs615
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 9:25=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, Dec 17, 2024 at 05:46:06PM +0530, Dikshita Agarwal wrote:
> >
> >
> > On 12/17/2024 5:37 PM, Dmitry Baryshkov wrote:
> > > On Tue, Dec 17, 2024 at 04:27:36PM +0530, Dikshita Agarwal wrote:
> > >> Hi Josh,
> > >>
> > >> Here is the updated pull request. please let me know if a new mail i=
s
> > >> required for the same.
> > >>
> > >> The following changes since commit d4033141873bbbc79c954dfcea502726e=
e278c5e:
> > >>
> > >>   Merge branch 'robot/pr-0-1734347915' into 'main' (2024-12-16 12:38=
:57 +0000)
> > >>
> > >> are available in the Git repository at:
> > >>
> > >>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > >> video-fw-SC7180-QCS615
> > >>
> > >> for you to fetch changes up to 9778d18566912efa6c811ffde4cf4432a8990=
e85:
> > >>
> > >>   qcom: venus-5.4: update firmware binary for sc7180 and qcs615 (202=
4-12-17
> > >> 16:19:47 +0530)
> > >
> > > Could you please clarify: previously you've had the same FW version f=
or
> > > SC7180 and for QCS615, just two different binaries. Now you are
> > > providing a single binary with the updated version. Are there any
> > > additional changes between those two versions? Or is it just a change
> > > in the signatures?
> > >
> > There is one additional bug fix where some unwanted buffer size checks =
are
> > removed for encoder session.
>
> Thanks!
>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/391

josh
