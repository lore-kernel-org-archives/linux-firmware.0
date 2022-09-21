Return-Path: <SRS0=N2Kp=ZY=redhat.com=btissoir@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553BCC32771
	for <linux-firmware@archiver.kernel.org>; Wed, 21 Sep 2022 10:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0EED0C433D7; Wed, 21 Sep 2022 10:17:20 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44EF2C433D6
	for <linux-firmware@kernel.org>; Wed, 21 Sep 2022 10:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 44EF2C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663755437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tXJHoz876JXyWdIzmz4FeK1YaPw2FwSEN3I5pptho3c=;
	b=EKjXB1gu2N1EJQsc0nJYGs488iwnT7UeLBYH/R47A7YK5zUPD3MM6CD0YgaWGj0J5Fk2/A
	M0D7DTtn5pPJ2R3i6b8tKfpmW0E0EyVUtcW/Kpecl9qBLeveryQFPLlsZ4VV7UJN1GmBFE
	G7gdwq7wm6XSHEkUZpX3v9A0HaDTccE=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-zDxAP9YoNISnYTahqKtTOQ-1; Wed, 21 Sep 2022 06:17:16 -0400
X-MC-Unique: zDxAP9YoNISnYTahqKtTOQ-1
Received: by mail-il1-f197.google.com with SMTP id m5-20020a056e021c2500b002f65685226eso1894892ilh.4
        for <linux-firmware@kernel.org>; Wed, 21 Sep 2022 03:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=tXJHoz876JXyWdIzmz4FeK1YaPw2FwSEN3I5pptho3c=;
        b=HpcMCFbLor4zsoos2AAnvxWwQkeeWh6eHh5wP2U1veXSMCEF0CC/S2O3Z19pVNiT7G
         iV9uWetVIOWFphwoddTjRXqoYlKdGc4MYms4vcLX8eCkISydNbRbJALYHL5M4LPZ8N7e
         fR4T2qhvTbkPWm2oLwDBwbH9cO42Higvc+PD4yD62Bnuw18kYHk8PGQz1D7Po//tSFgc
         32Mvq6clce1lmXl7VCfjLd8ucsQVwKFS4XuaTyBxeGZXHDOSvEw8LODAgc9uHZ8XXa8Z
         8mC87E9l+Z4tmEhWEc35BXPHxMhyWHlnuKIXyixp25iGxI5r/flo4k0aVMnGA8eZC24K
         a7sA==
X-Gm-Message-State: ACrzQf0MvyWQu8qe2LtSRN+Z4KHd5qVKrWgM/dQvHAoit31s839W07Xg
	I3ibHxkJchbca+z85CkWWpSqVKsvkcwq682yizJImGAxTJxSJIcR5bPBgb3ysb9Mgz9nYgtfMCv
	l8LhbpOt1a1vjQ5/y/oajWwSP3dBW5264GX58
X-Received: by 2002:a05:6638:25d3:b0:35a:41e1:bb6a with SMTP id u19-20020a05663825d300b0035a41e1bb6amr13596408jat.36.1663755435561;
        Wed, 21 Sep 2022 03:17:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM688ewOCyJLZ/txeb59b05RRH+aUBqA1+qGDipJrnApOiSoUL2NrJFNlfnTCiqiiwvpKfPTErDMDcjRgo3gi9I=
X-Received: by 2002:a05:6638:25d3:b0:35a:41e1:bb6a with SMTP id
 u19-20020a05663825d300b0035a41e1bb6amr13596395jat.36.1663755435297; Wed, 21
 Sep 2022 03:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <CA+5PVA5ymJ-ghhhCfEBPxBynucF3gD+nHVNwcZkC5bsVotatDQ@mail.gmail.com>
In-Reply-To: <CA+5PVA5ymJ-ghhhCfEBPxBynucF3gD+nHVNwcZkC5bsVotatDQ@mail.gmail.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Wed, 21 Sep 2022 12:17:04 +0200
Message-ID: <CAO-hwJJY+sRiHX9KWqTAuR7Q8=3J8vu=FneusRago87uQYSxfw@mail.gmail.com>
Subject: Re: linux-firmware signed commits; does anyone care?
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Juerg Haefliger <juerg.haefliger@canonical.com>, 
	Peter Robinson <pbrobinson@fedoraproject.org>, Takashi Iwai <tiwai@suse.com>, 
	contact@laurentcarlier.com, mpagano@gentoo.org, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>, Jared Dominguez <jaredz@redhat.com>, 
	Alex Deucher <alexdeucher@gmail.com>, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 16, 2022 at 3:33 PM Josh Boyer <jwboyer@kernel.org> wrote:
>
> Some time ago, we went back to doing ~monthly releases for
> linux-firmware primarily to help distributions package firmware in a
> simpler manner.  We GPG sign the tarballs, as is good practice, but as
> part of reintroducing the tarballs we also started having a
> linux-firmware maintainer GPG sign *every* commit done by a
> maintainer.  The intention there was that because we're dealing with
> binary blobs we really have no recourse to see changes unlike a source
> code repo.  The signed commits at least provides a measure for
> interested people to ensure the repo itself is only being committed to
> by a recognized maintainer and it isn't compromised (in theory).  The
> downside is that pull requests are merged non-ff and we wind up
> signing the merge commit.
>
> The question at hand though, is does anyone care about the GPG signed
> commits?  It's not clear to me this practice is even noticed nor if it
> is bringing any value to this project.  Since we've started this
> practice, I am literally the only one committing to the repo and while
> it isn't hard to do I want to know if it's actually useful to anyone.
>
> I ask for two separate reasons.  The first is that a group of
> interested firmware submitters is looking at modernizing the workflow
> for the linux-firmware project and moving to a merge request workflow
> instead of submitting giant binary blob patches via email.  This would
> allow us to put some CI in place for simple checks to the WHENCE file,
> etc.  Doing this while still having GPG signed commits isn't
> impossible but it certainly complicates things a bit, and would likely
> require a trusted bot to sign commits.  That has implications on
> secret storage and changes the dynamic on trust levels that make the
> whole thing even more questionable.

People already are saying that they do not see value in GPG signed
commits, but I'd like to add a few bits here.

As Josh said, the idea is that we modernize the workflow for
linux-firmware by automating what can be automated.
The first thing that seems to be possible is automatically merge
submitted MR assuming:
- the general CI tests are passing (Mario already has a few sanity ones)
- the commits do not touch WHENCE (so we have a reference on who is
responsible for what)
- the commits are signed by the maintainer of that said blobs (which
would be matched against the WHENCE file)

The idea is that if a maintainers of a blob submits a commit and signs
it, there is no real reason to not merge it ASAP, given that we can
always say: "well, it's the fault of X who is responsible of this file
and who signed it, so we know it's actually X".

Then comes the question of maintainers signing commits. If we ask
submitters to sign their commits to have a fast track, it makes IMO
sense to also ask the maintainers to sign their commits to show the
way it is supposed to be done. I wouldn't care much about the
automated bot that would merge the commit. If we need to have it sign
the merge commit, we can do it, and this will only give the
information that the process was followed.

>
> The second reason is that even if people are validating the GPG signed
> commits, it's not exactly user friendly.  I've been looking at
> sigstore and recor and that might be a better solution in the long run
> if we do want to utilize something like the current scheme.

TBH, do we ever need to validate signed commits besides in the CI case
or if something wrong happens?

To make a parallel, Linus requires people to sign their PR, but he
doesn't need to sign his commits. Because whatever goes into his tree
is from him, obviously him. However, he requires maintainers to send
signed PR to ensure this is coming from a trusted source. So he is the
only one caring for signed PR, and we just trust him.

So in our case, if signing for maintainers is not too much of a pain I
would say:
- to automate inclusion of blobs, we should ask vendors to sign their commits
- to show the way, maintainers should still sign their commits (even
if no one cares)
- the CI should verify who signed what and if the signature is valid
- end users only care about the signed tarball, that they trust the
maintainers will build from a tree that is trusted

OTOH, dropping the signing of the merge commit from the maintainers
would allow them to just hit the merge button in the UI, which might
be a simpler thing than having to forward that MR to a bot.

>
> I'll still GPG sign the tarballs, but I'd like to propose dropping our
> current self-imposed requirement that all commits are GPG signed.
> Thoughts?
>

I hope I didn't add too much confusion :)

Cheers,
Benjamin

