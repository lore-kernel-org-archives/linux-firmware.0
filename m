Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B267C64ED8
	for <linux-firmware@archiver.kernel.org>; Mon, 27 Feb 2023 17:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1192EC4339C; Mon, 27 Feb 2023 17:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFFD9C433EF
	for <linux-firmware@kernel.org>; Mon, 27 Feb 2023 17:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677519260;
	bh=BB6mFdrRfbJd0Vdglg46fYIAQRHit2d36v6ouuQViO8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=bINmEF6OAXv2PYqmLD1BWk3EPxfqPjNKSfVWzAcLrh0OjwPOqKYQ6aoTt43qGgkHr
	 /dK0oS1/v01OKe9EA+s5eH8qI9vHlDJ8tacXu46lVubPMIkYf9mr+10u7z2e2CwdFO
	 qkUexDOwoDdF3ykNZA4zUNTYSxceVrnI9NXdnX98tGQKAdJuDoWmnu3hqtfSSaiYy9
	 CRZ46rmZmYr2a7XmKUg2qNgkddQ384UQ0iqAHcNWEV4leOgjAB2oWhl3eF2vezeaWZ
	 pUyu7S2FQp+Omu/4DRAgjOL2YuNWVwp/NDKXLaiHk5YdZ4b13EE+5VzhW1pl7cVdCg
	 nQzpMtF+BFeKQ==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-536be69eadfso197715727b3.1
        for <linux-firmware@kernel.org>; Mon, 27 Feb 2023 09:34:19 -0800 (PST)
X-Gm-Message-State: AO0yUKXwBD4dwq1D26S4eXlPGHi7X0mbmtA7b4bDLjthLB3Z39v2b1PY
	d/n9lsujwhFzvwem8i91EhXuMmvW9OQcdFaSd9M=
X-Google-Smtp-Source: AK7set8qk10ht2CsZHzjM14MQhRc7F2WNkVwRiDFFZOyFZ7sC2dwQIPuTavpvdxJgnlzxX/8GFo+E1O3nQ0ApQqorZA=
X-Received: by 2002:a81:4425:0:b0:52f:69d:cc75 with SMTP id
 r37-20020a814425000000b0052f069dcc75mr10626108ywa.6.1677519258933; Mon, 27
 Feb 2023 09:34:18 -0800 (PST)
MIME-Version: 1.0
References: <BY3PR18MB4785E40BF7A834EE264B4D78ACA99@BY3PR18MB4785.namprd18.prod.outlook.com>
 <CA+5PVA5OUi76B-ex8X2HiJ1XsFzKcwrFstObEAYCuDDJxDgkjQ@mail.gmail.com> <BY3PR18MB478532269BE8A5E1C8DE4A0AACAF9@BY3PR18MB4785.namprd18.prod.outlook.com>
In-Reply-To: <BY3PR18MB478532269BE8A5E1C8DE4A0AACAF9@BY3PR18MB4785.namprd18.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 27 Feb 2023 12:34:08 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6VESUXfERWQT1+Ozusuqd0_iVO+Mb3EJv8oo-t+gKWjQ@mail.gmail.com>
Message-ID: <CA+5PVA6VESUXfERWQT1+Ozusuqd0_iVO+Mb3EJv8oo-t+gKWjQ@mail.gmail.com>
Subject: Re: [EXT] Re: pull request: liquidio: remove lio_23xx_vsw.bin
To: Derek Chickles <dchickles@marvell.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, Satananda Burla <sburla@marvell.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 27, 2023 at 12:12 PM Derek Chickles <dchickles@marvell.com> wrote:
>
> > From: Josh Boyer <jwboyer@kernel.org>
> > Sent: Monday, February 27, 2023 7:42 PM
> > To: Derek Chickles <dchickles@marvell.com>
> > Cc: linux-firmware@kernel.org; Satananda Burla <sburla@marvell.com>
> > Subject: [EXT] Re: pull request: liquidio: remove lio_23xx_vsw.bin
> > >
> > ----------------------------------------------------------------------
> > On Fri, Feb 24, 2023 at 7:27 PM Derek Chickles <dchickles@marvell.com>
> > wrote:
> > >
> > > Hi,
> > >
> > > We would like to remove one firmware binary from this repository per our
> > security team's concerns (Cavium was acquired by Marvell).
> >
> > What security concerns would those be?  Where would users of these
> > devices get firmware from?
>
> Hi,
>
> Thanks for the comments.
>
> Per the commit text, this firmware was originally just a proof-of-concept
> and not released to customers, but it had a default password that hackable.
> Commit text below for reference:

My apologies, Derek.  I started looking at this, got distracted, and
then did not remember that I had not looked at the actual commit in
the pull request.  You've provided perfectly clear and sufficient
detail.

>   Removing lio_23xx_vsw.bin which has a security vulnerability.
>   This binary was published originally as a proof-of-concept and is
>   not installed in any production devices and should not be used. In
>   addition, the aforementioned LiquidIO devices are end of service.
>
> The full security advisory can be found here:
>  https://www.marvell.com/content/dam/marvell/en/public-collateral/server-processors/marvell-security-advisory-liquid-io2.pdf

Thank you for this link.

Pulled and pushed out.

josh

> > > Thanks,
> > > Derek
> > > --
> > > The following changes since commit
> > 83f1d7781300b52785c062a8285da59042c0d1ff:
> > >
> > >   Merge branch 'ath10k-20230215' of
> > > git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware
> > > (2023-02-15 14:27:03 -0500)
> > >
> > > are available in the git repository at:
> > >
> > >
> > >
> > > https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_dchick
> > > les_linux-
> > 2Dfirmware.git&d=DwIBaQ&c=nKjWec2b6R0mOyPaz7xtfQ&r=8Rw3U3rPX
> > > 8xw42aFKYrg3JmXeZiOQmTC82HBznxAHSw&m=-
> > 19_Yj8VxC4EAW3wExRJagpBzNcwgVMR7
> > > qAtxPhgGzncOscuAHJ4Rr-oPQcI-3gk&s=GxsrbcsMV9Jsxfx3-LO0s3DtK0rEN-
> > SO2UpH
> > > sG5dTG4&e=  liquidio-20230222
> > >
> > > for you to fetch changes up to
> > c6008409440f18da7109e20a3f8db0c6c0a0586b:
> > >
> > >   liquidio: remove lio_23xx_vsw.bin (2023-02-22 18:48:26 -0800)
> > >
> > > ----------------------------------------------------------------
> > > Chickles, Derek (1):
> > >       liquidio: remove lio_23xx_vsw.bin
> > >
> > >  LICENCE.cavium_liquidio   | 361 -------------------------------------------------------
> > -----------------------------------------
> >
> > There are multiple liquidio firmware files under this license.  You can't
> > remove it just because you want to remove only one firmware.
> >
>
> If you look closely at the License file the section deleted was referring to
> the lio_vsw_23xx.bin file specifically. Since this file is being removed the
> License section is also being removed.
>
> Regards,
> Derek
>
> > josh
> >
> > >  WHENCE                    |   3 -
> > >  liquidio/lio_23xx_vsw.bin | Bin 20434408 -> 0 bytes
> > >  3 files changed, 364 deletions(-)
> > >  delete mode 100644 liquidio/lio_23xx_vsw.bin
