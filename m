Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C40C433F5
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Dec 2021 14:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A0C6C36AE6; Thu, 16 Dec 2021 14:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 138ADC36AE0
	for <linux-firmware@kernel.org>; Thu, 16 Dec 2021 14:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639665605;
	bh=OXsh/mWbcdRKUDXiDKjJWf4K8TCYYVEmBoTKCYt7DnI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=pp4dw/EYudmGdXXAU2CeO0nFmRli09we8lMfsqAfkJEfYzf1/FMpX8AeYP0fmtOqK
	 MpardCFDGZ2jrf7cBG7Y81imCbB0tVMrjeOmLlzeVa04+o/xDNwAmXRN3V9Up7Yc95
	 zijWCfZAlXaTBbr3heJyZPmiOtMHhHbvMGfJ7GkjzPEWLKz+xI9v05NjFBEEs1DCPm
	 J3JZ0k+YWs10nj59Cf+AYavngIyUEAmxLNAYQrQGAQKedKsGFReOtiCvtZAD9AiZe5
	 23CwXXtX0Uw0FPYTJUJw1lJfpDI9+Uwd8bXP3Y43QBJOMkd8M2Yfy1jqGy+COM/Qkc
	 svihjffrJcf5Q==
Received: by mail-io1-f47.google.com with SMTP id x6so35161434iol.13
        for <linux-firmware@kernel.org>; Thu, 16 Dec 2021 06:40:05 -0800 (PST)
X-Gm-Message-State: AOAM532RCpXn6IKLiDYPAUR0U1hl4p1VrRPZsAWOCCrqU6ViRRsB3VI7
	b4v+2IvJ95wH8Go6U53d1xHGYB9m09JvJ+i1ikw=
X-Google-Smtp-Source: ABdhPJyzT9FWyrrw36jO6tkuOMsY0wrTDeJVIPeoPn+q3lhxwelvnpPNEmKheiDPgqearB5vjsKsKPgpKewfKv2scx4=
X-Received: by 2002:a05:6602:1609:: with SMTP id x9mr9554152iow.209.1639665604048;
 Thu, 16 Dec 2021 06:40:04 -0800 (PST)
MIME-Version: 1.0
References: <9d3a16d4327fd6bb0a52cfe8e4bb0857a81494f2.camel@intel.com>
 <2b6c0de45581430daff7f698e94d94ad@intel.com> <edc5973fa662d059d4ffa3d01c5e7823817d5784.camel@intel.com>
In-Reply-To: <edc5973fa662d059d4ffa3d01c5e7823817d5784.camel@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 16 Dec 2021 09:39:53 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4mVcs4sejbE=Y4Ofy0Ev-L34qcds2WfZLeOcUXy+Rcyg@mail.gmail.com>
Message-ID: <CA+5PVA4mVcs4sejbE=Y4Ofy0Ev-L34qcds2WfZLeOcUXy+Rcyg@mail.gmail.com>
Subject: Re: [Intel-gfx] i915 Updates: ADL-P DMC v2.14
To: "Tolakanahalli Pradeep, Madhumitha" <madhumitha.tolakanahalli.pradeep@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "Hutchings, Ben" <ben@decadent.org.uk>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "kyle@mcmartin.ca" <kyle@mcmartin.ca>, 
	"Srivatsa, Anusha" <anusha.srivatsa@intel.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Sincere apologies for the delay.  Pulled and pushed out.

josh

On Wed, Dec 15, 2021 at 6:41 PM Tolakanahalli Pradeep, Madhumitha
<madhumitha.tolakanahalli.pradeep@intel.com> wrote:
>
> Bump! :)
>
> Thanks,
> - Madhumitha
>
> On Wed, 2021-12-08 at 18:11 +0000, Srivatsa, Anusha wrote:
> > Ping :)
> > Can these updates be merged to linux-firmware?
> >
> >
> > Thanks,
> > Anusha
> >
> > > -----Original Message-----
> > > From: Tolakanahalli Pradeep, Madhumitha
> > > <madhumitha.tolakanahalli.pradeep@intel.com>
> > > Sent: Thursday, December 2, 2021 6:48 AM
> > > To: Hutchings, Ben <ben@decadent.org.uk>;
> > > intel-gfx@lists.freedesktop.org;
> > > kyle@mcmartin.ca; jwboyer@kernel.org
> > > Cc: Srivatsa, Anusha <anusha.srivatsa@intel.com>; linux-
> > > firmware@kernel.org
> > > Subject: [Intel-gfx] i915 Updates: ADL-P DMC v2.14
> > >
> > > Hi Ben, Josh, Kyle,
> > >
> > > Kindly add the below i915 changes to linux-firmware:
> > >
> > > The following changes since commit
> > > b0e898fbaf377c99a36aac6fdeb7250003648ca4:
> > >
> > >   linux-firmware: Update firmware file for Intel Bluetooth 9462
> > > (2021-
> > > 11-23 12:31:45 -0500)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://anongit.freedesktop.org/drm/drm-firmware
> > > adlp_dmc_v2.14_update
> > >
> > > for you to fetch changes up to
> > > 2a2aa410c2eaebe5807d1fd321e42b8f53288d91:
> > >
> > >   i915: Add DMC firmware v2.14 for ADL-P (2021-12-01 16:50:30 -
> > > 0800)
> > >
> > > ----------------------------------------------------------------
> > > Madhumitha Tolakanahalli Pradeep (1):
> > >       i915: Add DMC firmware v2.14 for ADL-P
> > >
> > >  WHENCE                    |   3 +++
> > >  i915/adlp_dmc_ver2_14.bin | Bin 0 -> 77300 bytes
> > >  2 files changed, 3 insertions(+)
> > >  create mode 100644 i915/adlp_dmc_ver2_14.bin
> > >
> > > Thanks!
> > > - Madhumitha
> > >
> >
>
