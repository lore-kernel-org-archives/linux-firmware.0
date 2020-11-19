Return-Path: <SRS0=SxTj=EZ=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01E7C63697
	for <linux-firmware@archiver.kernel.org>; Thu, 19 Nov 2020 13:34:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9CBEF22255; Thu, 19 Nov 2020 13:34:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E82332080A;
	Thu, 19 Nov 2020 13:34:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRXUYoF2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E82332080A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexdeucher@gmail.com
Received: by mail-wm1-f52.google.com with SMTP id p22so7207124wmg.3;
        Thu, 19 Nov 2020 05:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c93R1HYyRsAfAkiRJWn7HdgzNnvJZ8+uOlY7gFRh7C0=;
        b=DRXUYoF2IZ+o5uD9++30kvuyeEdjbqyk/mbI1/QM/H+R0ilMhUgXX1AMZ890sazmwu
         PRVM1VOU9DpWogBrX7n0MbGczUG7SHTRQE4gnsI64rwfjPMfhHY2EmCIAGQMUQiMws2V
         u66pBmoPLCt8kxMJFYXBBWSClffSMTWwq3JAfWGGiXNIIXm40no6rwecK4oWbyR5HhKO
         6kjDrRptG8VxoIaHiwAF82nTf0BVA7urYVxJz/06aBGKmtX52+li5LKCgJ0AUoX6N9wu
         8/vogyeEAPIhxR3HyzoCgGdTwXXSZrVYplaN1O6WmKj++QgCrCDLAe8bt7fvMkWY5ucN
         Xk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c93R1HYyRsAfAkiRJWn7HdgzNnvJZ8+uOlY7gFRh7C0=;
        b=t34sppyN4qyslOW7avLQW/wrW2B0mlN3jxcXftaoFFk65UyVMvjFZGiR1YYpVyKjKC
         UON3GX9yEr504zq3ZOxI1iGF3e0Qe0A4Q7mqvtQE+12QfsowOANZeJr3IHaVpdgHgCzW
         AjUuZItBI7DQUTiuCqZz0LwjXOmN2xQabfFlrHGN3ZbdhzzOmYS3TMx5B/knpmHG1dEr
         EQ812h5cb5gQ6fOIcJGDVkG+jE44kqKGZWDdwOZYem6Zvmp6nANKR/nzLmWmLJYTCMvn
         KSgG7aHci3nCIdqbTyWpQOFJ7tkZ4xexcJ4xejN47YiKUNYBZmNfO7kQP6/vzeB2lZFQ
         DxXg==
X-Gm-Message-State: AOAM5320uNwwMP1sRCnw+W3xiRMcGPrhxMuuKhZUBUImNlAJ/uQuNvD4
	+Mp6lS6z9knwG8OMR1eDnvgzI0/9qdCVf4F+jQmzUkc6
X-Google-Smtp-Source: ABdhPJxwAT+pvVM0a+SJWlhv6plZQoFzdvfEEZHDu8ITuUcaApJqVb3fGuyYk0nweH+P2MyxJA2TpAIYQWBpjEAfNT0=
X-Received: by 2002:a1c:f017:: with SMTP id a23mr4731445wmb.56.1605792846122;
 Thu, 19 Nov 2020 05:34:06 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_NeOPVjq7Q1d-sWVuwOrNUbE4F1pxqR6FnCJJregv_uog@mail.gmail.com>
 <CA+5PVA63Ywoy+3G-8iLZst4oLNBKt0Tn40yBs__kU+YOHKjWKg@mail.gmail.com>
In-Reply-To: <CA+5PVA63Ywoy+3G-8iLZst4oLNBKt0Tn40yBs__kU+YOHKjWKg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 19 Nov 2020 08:33:54 -0500
Message-ID: <CADnq5_PT43H-Nnp8XPH7KTcuhhBDaRBWxHN90JPZu_eXrtdMyA@mail.gmail.com>
Subject: Re: updated amdgpu firmware
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 19, 2020 at 6:29 AM Josh Boyer <jwboyer@kernel.org> wrote:
>
> Applied and pushed out.
>
> You had a typo in the WHENCE entries (missing the 'h' in cichlid) in
> the last patch that caused this error:
>
> [jwboyer@vader linux-firmware]$ ./check_whence.py
> E: amdgpu/sienna_ciclid_ce.bin listed in WHENCE does not exist
> E: amdgpu/sienna_ciclid_dmcub.bin listed in WHENCE does not exist
> E: amdgpu/sienna_ciclid_me.bin listed in WHENCE does not exist
> E: amdgpu/sienna_ciclid_mec.bin listed in WHENCE does not exist
> E: amdgpu/sienna_ciclid_mec2.bin listed in WHENCE does not exist
> E: amdgpu/sienna_ciclid_pfp.bin listed in WHENCE does not exist
> E: amdgpu/sienna_ciclid_rlc.bin listed in WHENCE does not exist
> E: amdgpu/sienna_ciclid_sdma.bin listed in WHENCE does not exist
> E: amdgpu/sienna_ciclid_smc.bin listed in WHENCE does not exist
> E: amdgpu/sienna_ciclid_sos.bin listed in WHENCE does not exist
> E: amdgpu/sienna_ciclid_ta.bin listed in WHENCE does not exist
> E: amdgpu/sienna_ciclid_vcn.bin listed in WHENCE does not exist
> E: amdgpu/sienna_cichlid_ce.bin not listed in WHENCE
> E: amdgpu/sienna_cichlid_dmcub.bin not listed in WHENCE
> E: amdgpu/sienna_cichlid_me.bin not listed in WHENCE
> E: amdgpu/sienna_cichlid_mec.bin not listed in WHENCE
> E: amdgpu/sienna_cichlid_mec2.bin not listed in WHENCE
> E: amdgpu/sienna_cichlid_pfp.bin not listed in WHENCE
> E: amdgpu/sienna_cichlid_rlc.bin not listed in WHENCE
> E: amdgpu/sienna_cichlid_sdma.bin not listed in WHENCE
> E: amdgpu/sienna_cichlid_smc.bin not listed in WHENCE
> E: amdgpu/sienna_cichlid_sos.bin not listed in WHENCE
> E: amdgpu/sienna_cichlid_ta.bin not listed in WHENCE
> E: amdgpu/sienna_cichlid_vcn.bin not listed in WHENCE
> [jwboyer@vader linux-firmware]$
>
> but I just fixed it in-place.

Thanks!

Alex

>
> josh
>
> On Wed, Nov 18, 2020 at 10:00 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Updated amdgpu firmware for 20.45.  Please apply!
> >
> > Thanks,
> >
> > Alex
