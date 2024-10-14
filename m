Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0908D1813A
	for <linux-firmware@archiver.kernel.org>; Mon, 14 Oct 2024 17:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8132CC4CECF; Mon, 14 Oct 2024 17:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B84AC4CED1
	for <linux-firmware@kernel.org>; Mon, 14 Oct 2024 17:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728928763;
	bh=5l1TdUTRLLI3sFYlWXSDbzcwWfvpDLz8hQWyzSdwK6Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=JLbG4qCOgJOBQKsYe8qFxG/RXdKjMFbNByuT/x2xAt0rmx/5yDW6IBrpWsTqt3mjo
	 molBv1N0bpLILavO4agtG63OLGnhwnqOxaoFLsChVLB73C5JgXfq1A4PEfBUZn2O+L
	 RKcUe3EOLMkbKOaTYK81poEqiikNTSB7v5MkSdwS/Xl14O+19ioEK1f2iErwRUdX0e
	 NUvm8eRbNu5+k9AdbpMcJjNxGwbQ2AP/wOq3YeK/Ldui3++D5c8p+KH9qVCct+6dKM
	 haCxz/3GXHxhalOu8Q59CgxW8zpl+sg6m2p5PAhm6BoLwcBZjpttDjHbxyAGFRZ7Vr
	 LsjkjfnDfXETA==
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e28fc40fdccso4109974276.1
        for <linux-firmware@kernel.org>; Mon, 14 Oct 2024 10:59:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcZG/SIOLiImom75qXczQ6JARS8CVT/wJFO5bBveFjEvV62sXvdZPfYAS1rDq9ed21UDwwcJLOPMoHbiZNDg==@kernel.org
X-Gm-Message-State: AOJu0YyaKvP8+KWyARLImkEkqebQXqXNO3g4jc5wvT0WE14LFapwx12t
	A8fLYzWewYvx0G+fPLQ6sifo8kgyW/FMmSt+hAqUT7DnZ66cXeF8EwZng8jQ9RL+IpE5IYaYlZh
	e+9BIx+9ymkT3twKwOjT00HaHePg=
X-Google-Smtp-Source: AGHT+IGTvLp5s+krDK/bPocU85Hud60gyP7zNejtRAmrVfD+Snzzq2jP+mzcWu4HEmfYkAstptNJqebMFOu7H/bFklo=
X-Received: by 2002:a05:690c:48c8:b0:6db:e045:3b07 with SMTP id
 00721157ae682-6e364138e72mr71408047b3.17.1728928762545; Mon, 14 Oct 2024
 10:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <17161839-07cf-4167-be99-220ff23b17bc@quicinc.com>
 <sawsdn6kvjymvocnrb2t27o6qcuj2lpctv465plzfq7io7f23u@nmck7rrgvdbu>
 <0375ab16-8f0a-4520-9073-13dfea660f30@quicinc.com> <CAA8EJpoFumfn3b8FhV-AsbPw-dcg5UsSS0eEsG36p0YuC+69xA@mail.gmail.com>
In-Reply-To: <CAA8EJpoFumfn3b8FhV-AsbPw-dcg5UsSS0eEsG36p0YuC+69xA@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 14 Oct 2024 13:59:10 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4x7qgfZfeSOTTMX539guHuvrYCN4umHjQq-ZyZ3S-pDg@mail.gmail.com>
Message-ID: <CA+5PVA4x7qgfZfeSOTTMX539guHuvrYCN4umHjQq-ZyZ3S-pDg@mail.gmail.com>
Subject: Re: [GIT PULL] QCA: Add Bluetooth firmwares for WCN785x with UART transport
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: quic_zijuhu <quic_zijuhu@quicinc.com>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 7:07=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 10 Oct 2024 at 13:18, quic_zijuhu <quic_zijuhu@quicinc.com> wrote=
:
> >
> > On 10/10/2024 6:00 PM, Dmitry Baryshkov wrote:
> > > On Wed, Oct 09, 2024 at 04:30:34PM GMT, quic_zijuhu wrote:
> > >> Hi linux-firmware maintainers,
> > >>
> > >> Here's a pull request for btqca bluetooth driver. Please let me know=
 if
> > >> you have any problems.
> > >>
> > >> The following changes since commit 919f79f9fb5536c1928a15ac82a2e5318=
3b213cf:
> > >>
> > >>   Merge branch 'amd-staging' into 'main' (2024-10-04 21:12:04 +0000)
> > >>
> > >> are available in the git repository at:
> > >>
> > >>   https://github.com/zijun-hu/qca_btfw

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/328

josh

> > >>
> > >> for you to fetch changes up to 2a8ffa36567f300041c6d6d509b897a4fcc42=
916:
> > >>
> > >>   QCA: Add Bluetooth firmwares for WCN785x with UART transport
> > >> (2024-10-09 16:01:30 +0800)
> > >>
> > >> ----------------------------------------------------------------
> > >> Zijun Hu (1):
> > >>       QCA: Add Bluetooth firmwares for WCN785x with UART transport
> > >
> > > Could you please confirm that the licence for these files is
> > > LICENSE.qcom rather than the typical LICENSE.QualcommAtheros_ath10k ?
> > >
> >
> > Confirmed that it is LICENSE.qcom
>
> Thanks for the confirmation!
>
>
> --
> With best wishes
> Dmitry
