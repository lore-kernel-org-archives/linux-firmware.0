Return-Path: <SRS0=JNLW=ZT=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F65ECAAA1
	for <linux-firmware@archiver.kernel.org>; Fri, 16 Sep 2022 21:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4101C433B5; Fri, 16 Sep 2022 21:29:23 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6F55C433D7;
	Fri, 16 Sep 2022 21:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A6F55C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1274ec87ad5so54017970fac.0;
        Fri, 16 Sep 2022 14:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=yR03AC7skqm4Sf0BoWlU++GD1rfqR8bze/qTUtC2nV4=;
        b=nmwBVnF27sMALH+ZRjJIloQ0ORAOz0/G/ggoA51mzfJ+Y79r7koANnb2Wh4jX+7UzC
         4LyyY3NI+YZ5UN/LgrVGyVSmZ5r7CiCjLV8QJcNxCQoPHNUhJXhF6pI4wCK4VVNTdOmd
         UGgvmNF3/V/+jxEwoHVP11IUtV4K57C25SAubcBwrQLcJpvEFE6NUYPKc/RPfpvjCMIN
         QkgNXYbz+Z3srSj/UplFXGGmpnYAd01lxIK6wW02cE5Sp8Y7Zy/cPp13xJkaTUaCWpBV
         SecKTlJew/OKyiiJs2blS2IM31QouOQvR7iR0jO4KotmRonw9LnNFZgpWnVMbYqZqWZg
         cxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=yR03AC7skqm4Sf0BoWlU++GD1rfqR8bze/qTUtC2nV4=;
        b=WPvNmaWwLrqpodKwQjVgIL1q7JsVuoeAzw7XAb8FBfq/84UNFfntMBWcGfHCXmorBw
         YFWHNCR3vysq3tWqMW9NGj2yIM/cYCp/1/NXK+0WW1PjvubyNoDQVu2M7D//RwDuyh1o
         Pc57fEEi6dlWh7Qx8OWXnRW+5jX9REtHzOzd/qGJFF1X8qbVPZtUMNPE9HA1FQ7ZrH7z
         rKLMDCF3TutDVS1OIDsQY/mZArAEsi0idOlGLKHBTQm206FRxUeszqMdgKf8fh85+7lG
         ZKfYGDX6xkSAn+n+ohzeJLh5lp3/YtraaV45DniFjQtLJFikAjuZplRE53EJ406KVwZf
         h84Q==
X-Gm-Message-State: ACgBeo2uLzkvtBzCqLq2K2YgCNxZNAhBle5J2U6iY72tEie0GSlLsh+/
	5F6yRxUtX3+R1Alf0OJNg0987E6SSj47NdklVVrvf/Mh
X-Google-Smtp-Source: AA6agR5iMb/4oOijTsdzbyI+HbVDzLhQNa0y8/uYFeeLzPxH4WLVBb4XBVeSh0vmtUpsqol8cpkSrGRIiHksuSv80aU=
X-Received: by 2002:a05:6870:1783:b0:12a:f442:504d with SMTP id
 r3-20020a056870178300b0012af442504dmr10243841oae.46.1663363761631; Fri, 16
 Sep 2022 14:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <CA+5PVA5ymJ-ghhhCfEBPxBynucF3gD+nHVNwcZkC5bsVotatDQ@mail.gmail.com>
In-Reply-To: <CA+5PVA5ymJ-ghhhCfEBPxBynucF3gD+nHVNwcZkC5bsVotatDQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 16 Sep 2022 17:29:10 -0400
Message-ID: <CADnq5_MC+WYSdPPmMoFYzwwC1ANwtjo0XvEhOLbOLkPfYs4hiw@mail.gmail.com>
Subject: Re: linux-firmware signed commits; does anyone care?
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Juerg Haefliger <juerg.haefliger@canonical.com>, 
	Peter Robinson <pbrobinson@fedoraproject.org>, Takashi Iwai <tiwai@suse.com>, 
	contact@laurentcarlier.com, mpagano@gentoo.org, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>, Jared Dominguez <jaredz@redhat.com>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

No objections from me.  I don't see much value in it.

Alex

On Fri, Sep 16, 2022 at 9:33 AM Josh Boyer <jwboyer@kernel.org> wrote:
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
>
> The second reason is that even if people are validating the GPG signed
> commits, it's not exactly user friendly.  I've been looking at
> sigstore and recor and that might be a better solution in the long run
> if we do want to utilize something like the current scheme.
>
> I'll still GPG sign the tarballs, but I'd like to propose dropping our
> current self-imposed requirement that all commits are GPG signed.
> Thoughts?
>
> josh
