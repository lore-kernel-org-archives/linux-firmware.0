Return-Path: <SRS0=hYif=65=gmail.com=casaxa@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56481C678DB
	for <linux-firmware@archiver.kernel.org>; Sun,  5 Mar 2023 00:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0A9C7C433D2; Sun,  5 Mar 2023 00:30:47 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC71AC433EF
	for <linux-firmware@kernel.org>; Sun,  5 Mar 2023 00:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EC71AC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id e9-20020a056830200900b00694651d19f6so603219otp.12
        for <linux-firmware@kernel.org>; Sat, 04 Mar 2023 16:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677976245;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CGDD6Kn1yVx8sIJYCxQhP7C47HaKxJdveu/zWV48DGc=;
        b=RK9vs4Kt9YSwgRGnuanlpzg78yLWTS2//v19ReBPN77A5hxY5RxyZ0ELsdYmkin3je
         HsFxBBmvpIvWJSqQzFUe6idyZ3EDPFeFRrw4Nf9cjW1lGGZqKzfVAG+DE9Xu00kWHGht
         6DjOLIfSPoaR59PHBKZTZDCHoFGpJS9J6qDx9gBBR4LMTUwIX83ngIKX6urqNuXgj6zD
         qbk05OvphNgeOUnYBpNxleSy9tjIxSe/tuh0Q1dgvSbSXdKRF3UYe41ta5CpsRfV7qNa
         3wrfp5kOY5vDzi9+J1Y1vF/1DwhMuRg0mFEqSv+Are8G6pSFE2AU8ya5LAV5bhQ8Ya+s
         aV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677976245;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CGDD6Kn1yVx8sIJYCxQhP7C47HaKxJdveu/zWV48DGc=;
        b=Ye4XVQHEEp0yBhuxWddG9iUZLmxe/G5A3tSudl1hed/D//Bp2MQc/GAGe+rUqVdtzO
         cjSO8C4WdxylOnyzmOgZlf2QJ920VOEQh276l9V03Df5IKoBr0Pd5cB4XbhCtCvKw9L3
         rdQv2+aOlqCqMmXdsm04eA3u9TsYgj9BFDsB5EL6lAq2SR0qLVSo7vDtT3NzFCRWlwb3
         NSk6rZmcDRW5v3h9kIbXuRLHMfSTDqR80C50EYtWMmgRD+7H7GdDSOjDzc7s2jpursBU
         jK+5CUX2OzOBx9KtcCxcCf4L+1+THvUqHySaLgXDPTl44Ddc0nLpnvO47LMQGU45iTMn
         GqSg==
X-Gm-Message-State: AO0yUKUvDx/nOFkQCwqapUIh4xqK15oXro7p1nOpkSfE0IAOpnxIfnxc
	DrilbiQgdI4MRnF+QtUZXxmIgN4TC5hTENmDtZ3/NRzH
X-Google-Smtp-Source: AK7set/1nTnoBSX/EqID04lQLkwnL2EBnYvK94Z3ARWlvYevz6slTb35DBkjdb/m9FnOtCH2Gmrh1FBQIN4DxVy494Y=
X-Received: by 2002:a9d:5f97:0:b0:688:d1a8:389e with SMTP id
 g23-20020a9d5f97000000b00688d1a8389emr1993585oti.1.1677976244844; Sat, 04 Mar
 2023 16:30:44 -0800 (PST)
MIME-Version: 1.0
From: Sasa Ostrouska <casaxa@gmail.com>
Date: Sun, 5 Mar 2023 01:30:33 +0100
Message-ID: <CALFERdxXtfewr8yHekHjic3aAFq4UbRnjcZT=tqAxSkq5XU2YQ@mail.gmail.com>
Subject: Fixing symlinks of some intel firmware.
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/mixed; boundary="000000000000044cb205f61c4a6b"

--000000000000044cb205f61c4a6b
Content-Type: text/plain; charset="UTF-8"

Hi, in the last few updates of linux-firmware I saw there are some
wrong symlinks created
since the parent directory name is also in the link section.

The attached patch should fix the wrongly created symlinks.

Please cc me as I am not subscribed on this mailing list.

Rgds
Sasa

--000000000000044cb205f61c4a6b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="linux-firmware-intel-symlinks-fix.patch"
Content-Disposition: attachment; 
	filename="linux-firmware-intel-symlinks-fix.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_leunokr50>
X-Attachment-Id: f_leunokr50

ZGlmZiAtLWdpdCBhL1dIRU5DRSBiL1dIRU5DRQppbmRleCBlOTU3Y2M5Li5mZGI1ZjFkIDEwMDY0
NAotLS0gYS9XSEVOQ0UKKysrIGIvV0hFTkNFCkBAIC00MDcyLDcgKzQwNzIsNyBAQCBEcml2ZXI6
IHNuZF9zb2NfY2F0cHQgLS0gSW50ZWwgQXVkaW9EU1AgZHJpdmVyIGZvciBIU1cvQkRXIHBsYXRm
b3JtcwogCiBGaWxlOiBpbnRlbC9jYXRwdC9iZHcvZHNwX2Jhc2Vmdy5iaW4KIFZlcnNpb246IDQ0
YjgxYzRkNTM5N2E2MzEwODM1NmY1OGYwMzY5NTNkOWIyODhjNGUKLUxpbms6IGludGVsL0ludGNT
U1QyLmJpbiAtPiBpbnRlbC9jYXRwdC9iZHcvZHNwX2Jhc2Vmdy5iaW4KK0xpbms6IGludGVsL0lu
dGNTU1QyLmJpbiAtPiBjYXRwdC9iZHcvZHNwX2Jhc2Vmdy5iaW4KIAogTGljZW5zZTogUmVkaXN0
cmlidXRhYmxlLiBTZWUgTElDRU5DRS5JbnRjU1NUMiBmb3IgZGV0YWlscwogCkBAIC00MDgzLDE1
ICs0MDgzLDE1IEBAIERyaXZlcjogc25kX3NvY19hdnMgLS0gSW50ZWwgQXVkaW9EU1AgZHJpdmVy
IGZvciBjQVZTIHBsYXRmb3JtcwogRmlsZTogaW50ZWwvYXZzL3NrbC9kc3BfYmFzZWZ3LmJpbgog
RmlsZTogaW50ZWwvYXZzL3NrbC9kc3BfbW9kXzdDQUQwODA4LUFCMTAtQ0QyMy1FRjQ1LTEyQUIz
NENENTZFRi5iaW4KIFZlcnNpb246IDkuMjEuMDAuNDg5OQotTGluazogaW50ZWwvZHNwX2Z3X3Jl
bGVhc2UuYmluIC0+IGludGVsL2F2cy9za2wvZHNwX2Jhc2Vmdy5iaW4KLUxpbms6IGludGVsL2Rz
cF9md19rYmwuYmluIC0+IGludGVsL2F2cy9za2wvZHNwX2Jhc2Vmdy5iaW4KK0xpbms6IGludGVs
L2RzcF9md19yZWxlYXNlLmJpbiAtPiBhdnMvc2tsL2RzcF9iYXNlZncuYmluCitMaW5rOiBpbnRl
bC9kc3BfZndfa2JsLmJpbiAtPiBhdnMvc2tsL2RzcF9iYXNlZncuYmluCiBGaWxlOiBpbnRlbC9h
dnMvYXBsL2RzcF9iYXNlZncuYmluCiBWZXJzaW9uOiA5LjIyLjAxLjQ5MDgKLUxpbms6IGludGVs
L2RzcF9md19ieHRuLmJpbiAtPiBpbnRlbC9hdnMvYXBsL2RzcF9iYXNlZncuYmluCi1MaW5rOiBp
bnRlbC9kc3BfZndfZ2xrLmJpbiAtPiBpbnRlbC9hdnMvYXBsL2RzcF9iYXNlZncuYmluCitMaW5r
OiBpbnRlbC9kc3BfZndfYnh0bi5iaW4gLT4gYXZzL2FwbC9kc3BfYmFzZWZ3LmJpbgorTGluazog
aW50ZWwvZHNwX2Z3X2dsay5iaW4gLT4gYXZzL2FwbC9kc3BfYmFzZWZ3LmJpbgogRmlsZTogaW50
ZWwvYXZzL2NubC9kc3BfYmFzZWZ3LmJpbgogVmVyc2lvbjogMTAuMjMuMDAuODU1MQotTGluazog
aW50ZWwvZHNwX2Z3X2NubC5iaW4gLT4gaW50ZWwvYXZzL2NubC9kc3BfYmFzZWZ3LmJpbgorTGlu
azogaW50ZWwvZHNwX2Z3X2NubC5iaW4gLT4gYXZzL2NubC9kc3BfYmFzZWZ3LmJpbgogCiBMaWNl
bnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLmFkc3Bfc3N0IGZvciBkZXRhaWxzCiAK
--000000000000044cb205f61c4a6b--
