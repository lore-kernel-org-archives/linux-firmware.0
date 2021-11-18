Return-Path: <SRS0=lGAb=QF=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D5CC433EF
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Nov 2021 20:06:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5904161ACE; Thu, 18 Nov 2021 20:06:46 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FA9361ABD;
	Thu, 18 Nov 2021 20:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FA9361ABD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id r26so16758734oiw.5;
        Thu, 18 Nov 2021 12:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=/CgjJ8XqZ8H4XKbXWAiR8FIFYGA/XexXIQZpmFHOPPk=;
        b=ABnK5xUwifkQz5gZSGHd9mJgfVT1OMnraCCPizZxvdmNsld7/W6NEVRcaBNACffBZz
         e9Gn5+LsD0Yw6LXxCUreH25pNEnyv6TTi23uNLeObVVD2MTcnA1zEXw9Qqis6jm6NESH
         VkRMH7ylGYA6zub632lP9a+BIFNWJZsAsBwbI5LtjRp8db3D6BBu2ifgUWG6IZyWQXa9
         kLhY7n69NUPHfbmuleBgK6MPgF4m15Uj/zj620RMjXo/FYHORf1KO9CRouwV/v0A80BI
         syM5RGjjO+XzauwngzpaLL/17vA2zLMwPVbTn1iAYv4Om+O1aXcJ/NmvIRaISah8mtk8
         sxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=/CgjJ8XqZ8H4XKbXWAiR8FIFYGA/XexXIQZpmFHOPPk=;
        b=VkUzsvyVODc7ou7PZeLLdRHURwg1orpGWCx2NZYB2mEUevmWeGl3c2xRW+JinpN7um
         R2MeUBPvnpa/bJ/1CeNC7HdjjUPQ+oD8vqSjAlPpgAaDUoq4ugCUAVKXMjzpmbPtOn7C
         /KL5RbOODyhXmVz/jp3Yg5rvDdhaLqznWGiUSLTaI7xtPdG2SiEf+rOnNF+ZxsI0Co8J
         vV3e37LIVoPi3v9cPnAY4Y2/HMPZv4NDYeikAbEb6/XjQnnqU90KLUn1y0YzqJACNdzT
         ZgUlO5f+AyhGYja+kNhG5uaRvNsBJYyiP0tjZ2xt/0qP9lc8ZIaJMQkk29KLY2Rl0/31
         H1wg==
X-Gm-Message-State: AOAM533vao6BF37XG2SfkuZ0igcUMwSt6m/dnrQSqFz4trTjsQRlDI09
	kN97jrgzEyzWJMYzj4mOJW2rfBo+5SABMbIHYee/iyZW
X-Google-Smtp-Source: ABdhPJzNyj0P4E1dMEuSu7V0cprbMTpuVa08UZ4ODv5h1Ve//D3LRx1UWDbQi4QhmAQsAEO8j8xDpK6um7IQ4U7WsTw=
X-Received: by 2002:a05:6808:300b:: with SMTP id ay11mr10132728oib.120.1637266005305;
 Thu, 18 Nov 2021 12:06:45 -0800 (PST)
MIME-Version: 1.0
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 18 Nov 2021 15:06:34 -0500
Message-ID: <CADnq5_OCO3y0RhOTWB8yDhTKU3Ge98azCnEQx9nayDvFPR4U7g@mail.gmail.com>
Subject: updated amdgpu firmware
List-Id: <linux-firmware.lore.kernel.org>
To: Linux Firmware <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
Cc: Zhan Liu <zhan.liu@amd.com>
Content-Type: multipart/mixed; boundary="000000000000a636f905d115b221"

--000000000000a636f905d115b221
Content-Type: text/plain; charset="UTF-8"

Hi,

Updated amdgpu firmware for vangogh.  Please apply!

Thanks,

Alex

--000000000000a636f905d115b221
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-amdgpu-update-vangogh-DMCUB-firmware.patch"
Content-Disposition: attachment; 
	filename="0001-amdgpu-update-vangogh-DMCUB-firmware.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kw5dvgfn0>
X-Attachment-Id: f_kw5dvgfn0

RnJvbSA5M2VmN2U0YjMyYzcyZmQ3ZGFkOTNlZWYxYjA5YWQ1NGQ3YjcwNDBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFRodSwgMTggTm92IDIwMjEgMTU6MDM6NTMgLTA1MDAKU3ViamVjdDogW1BBVENI
XSBhbWRncHU6IHVwZGF0ZSB2YW5nb2doIERNQ1VCIGZpcm13YXJlCgpGcm9tIGludGVybmFsIGdp
dCBjb21taXQ6CmRkODk0ZjMyZTg3MGZlZTU0ODA3MjMyMDNjOTEyMDVmYzFmYTczZmUKClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBh
bWRncHUvdmFuZ29naF9kbWN1Yi5iaW4gfCBCaW4gODQ5ODAgLT4gODQ5ODAgYnl0ZXMKIDEgZmls
ZSBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YW1kZ3B1L3ZhbmdvZ2hfZG1jdWIuYmluIGIvYW1kZ3B1L3ZhbmdvZ2hfZG1jdWIuYmluCmluZGV4
IDVjOTU1MjVjZGY4MGYxOTE2YmQyMTY4MmFlZDdhMGRiYWU0ZGIwMGQuLjMwNTJhNjMyNGNkNDNm
NWU1NDkwMzZmZmRlZTBjYjRjMzY2M2ZhNGQgMTAwNjQ0CkdJVCBiaW5hcnkgcGF0Y2gKZGVsdGEg
Mzk4CnpjbVY7OTBkZkJIbWooMmYxdDljRzBSU2lmMDAwMzEwMDA5MzAwMEk2MDBaPCYwUlI5MjAw
NkN4OWw0UHA7MUVnegp6eU1BMjYwQExKJTB4LTdCQ3goKnswWnxKRTAwYU8zfE5qNjAwMDVDN1dG
WEgtPHx4eShiSDdUQkRzUFF+PnhUYm8Kek1LfDcwNyYxZH5yMzYrQnh4Qk9SMGZrIXUyRDVmdSk7
fEtRM2JSZ35iRkJtaDAwUk0kRil4M3VtS2Q7QTFoU1pYCnoqWSN1JjZtUWI7WjBFVWFlY2J0cEpg
KGBTV2Z1UXtIUFV7P1EreF9RKWswMDBRJl5kJnI2NSlXUSRqKiMtY3xiWAp6MWgzLWBHWFg4WFBI
U3UzMWMjKFE9a2kwIWtQRW9rc3ZyNG8rZk5sSV5ueXctWil8c3Y1bnQkUD5VS34mYzFOMT4Kekl7
SnRTSUtRYz0lYW12P1NqSzszeWh4NHNid1gqRHJQcmpZJXJKIShjb35xVWY+ZSh1QFEmWiFgQmtU
UjlRI2w4Cno2UT11KiVKX3ZvSGNicitFbX5lemRJKkM3a0U0NUMrfGEyTTA5OWlCaVZSfThGQiNm
UUt+ZzRBSD48YGs7TGErTwpzT2JQY1dyViomcDZ5VmBWSndkMlh2QSVQN2o7ZWUhSGtESjIoTipv
Pz5qeXVRZjUteEdmemJEQFYqbWdFCgpkZWx0YSAzOTgKemNtVjs5MGRmQkhtaigyZjF0OWNHMFJT
aWYwMDAzMTAwMDkzMDAwRjUwMFo8JjBSUjkyMDAzTm1tUGU1dzsxSVk1CnpaYDg7LUhoYVgqOXc5
TWZjWDUqdDBafEpEMDBhTzN8Tmo2MDAwNUM3V0ZTYihSdDF2eXhKSFA4M1hSP2t7KW9Ldgp6Jnsl
Q1klbWskbmkxZTBOYDV2P0kwZmshdTErI1d0KTt8Sl9UQyt9X2JGQm1nMDBSTSRGKXgzUzZrYjtt
RGYyVlgKekw9V0o+OytzLXsyNHxjbXVFUTtmMERwfmNQXjNFK2YoOTlmeTZVbjlyJCV3PDA8Nnwo
MDdpZXZ3YTRESDgpTT18CnpiMDAxNWUlWWR7OzhhJW9Wcyl7VXBad3RzemdhcEVefSY2JTVzUGlv
aWlzYik4YW5AUiNpQ2w4U0h3O2lCfHllewp6Mk14fjQ1QX1eQDZpZDQhbmkrcmV0bEhieFU2SVJX
VjZUeEhMV1BWfiNiUkEtWE9SZFRhaTN+ZWFzLXd5Qm50SkYKemkhej8hVnRyWnd7NlM/RGUrRj5+
Xjg+Z2g1UG9kdkNSTDVEZSN6fWghPUAwNCs/dkV2Y3lvKSlWYno5eSUod1hECnNgaCZLa2FWcTZS
QjQtUnRIZX12TVB1djBTWlFmU0orcz1tbXwyWntkbGI/JjE+YyM/NkZEJVpsTzhAYD4KCi0tIAoy
LjMxLjEKCg==
--000000000000a636f905d115b221--
