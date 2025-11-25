Return-Path: <SRS0=JnPY=6B=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C381D0E6EC
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Nov 2025 14:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD737C116B1; Tue, 25 Nov 2025 14:29:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 87669C4CEF1
	for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 14:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 87669C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APD82Cj3317683
	for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 14:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kvmoFOIl4zdk8YKigrafV3IH
	Vy9W4PL99Bv+nq2fYF0=; b=pQFugbQE+81KisJzjPpKSCJlhx7Ys/u9ED9nQyD+
	Gq75dpwkTcMbGB1eiY/kU0fh7hayskiBFzeEj1z5LQQ4dhYsJyPAExBtPF22ivOD
	wHes4M4rIfqShVV0IULTgHDZg2MtnKjWW4+NVQrhtsMcs2Dm3GyMNsKD7gJW2fhH
	IDxak7RN08Pq2CEVGLXhCKLp1TC95zzAqM1Ubh46pMqdXch4XphbXzT0p3FMhcK5
	WdqgldvIpEunfeVwU1HzS5LyiHFDT353tuXiKwmklATRzNfWAuKICNlxW4TeOYIO
	inasvpf2crvrJboIEzMDGMrkhhRRg/3/z43tCIvc/RmFFg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4and2qg70x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 14:29:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3416dc5752aso15716299a91.1
        for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 06:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764080984; x=1764685784; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kvmoFOIl4zdk8YKigrafV3IHVy9W4PL99Bv+nq2fYF0=;
        b=ezpQK7LwoEQ6urReAZCE47lO4BmOYGiUw1r2OhsitKNy1Y1gV371iOyaqWp6CL+0KE
         d9fZN/ju3la8xSqYwfYwBAtxZDjjD22W6kkjRmAaCrE6QHGV7V76jae4SunbI6e/ArBl
         Z8qnpaOX37SH3fHKY3sK0NAR6k2nqVczWKHrtLL5WPAlnxfrmDYqiw2155CCQj/8Opak
         abJ1WAyz0LTTWdVNsfpU1Qy0eDVQ7TL2FHR2FKPFQvv6qYKJncfSnp1aYvdlCKjGG+qm
         WVNZcqVy8yGaVOfplE2LqJZWZHcmUbN7vMYhSeKMS+LQfRWgNcsoH4jXcYmsh9zgGiqy
         IGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764080984; x=1764685784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvmoFOIl4zdk8YKigrafV3IHVy9W4PL99Bv+nq2fYF0=;
        b=dLtgBEI2HDgBAHRSpOzs+w1m/ZsuPR4Xq3EumANuWOV6PwrOFw9xO/4ecWzj9tgLkD
         NCmIwXUXHCDX6LVtSdPbJaNiUH/q3paiDzSE7ozt0NrqVuvjHligWdyphSYMYTaipvuP
         kT+mBjhL5gZZ92pAmXuqe02MThY7xy5NAp674Qv9BlYrgk8Wm8Vx6LdHv3S/ZrN4P2Sf
         9xXOQFKXSNNXXS9MFLFSjx7fj+pjFLEOAj+3WVTv1+56MLdzekvTQFqmM7ADA3NHj8+6
         tdh59B8o6qWEvShdz7WLd0kQdv16fNWpzZqTFv5CWG81acwY5V9+TNPKlGRTeH4p702l
         sXyQ==
X-Gm-Message-State: AOJu0YyDrhRwLqTr2t5qojfH/9dXHvJ3VdFi+wOk3ZCsw9QfPTINU1bY
	13wFH7VVhCqnZsLvGgV5dbR4Y2//PqGoq6SdD9LMc5IIm6gdr0O51kgnXRkZhw3jTaCBkikN8XM
	Zw2fdYeu/KLad7RKgu19iNpBKk+Rm0GITtyqVPeruSzSIqkMpwfTMvtKfQQHtM5F+BMnLx9pVe+
	IgAqBQqM0qQqf/+KQk30BClztmaVRh/ncttKFEknYj3p2YMOAs
X-Gm-Gg: ASbGnctY3rbjkE7iQaUnhwG/6nQ682BLWO+++RJjOlopmnGGUyPGaZQegxJKVjeR+lg
	io/L2pg7KatNuFzasgtZ8by8zcJCCV8QnCbU2C8OeRQYN2hkAH/HjZ22/ZLUnIk3cVh9ZA9Q2f3
	hpm88nydLUhIEjT5VvQL2KazXDSjNfYCxDSEFJXzBx/KyAAfSZJQVurR/kg5j4SCWsedHLQGeBz
	dNULcQ3
X-Received: by 2002:a17:90b:2d8e:b0:330:84c8:92d0 with SMTP id 98e67ed59e1d1-3475ed46424mr3201315a91.24.1764080983792;
        Tue, 25 Nov 2025 06:29:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzdd0WouZasFqCQrhMqJRln1qOIGzZThyD31JkF0+ZUgxNcqfqbdCNjh1bupLsHtSFkoTbrm4ohYe7KNv+AQo=
X-Received: by 2002:a17:90b:2d8e:b0:330:84c8:92d0 with SMTP id
 98e67ed59e1d1-3475ed46424mr3201285a91.24.1764080983216; Tue, 25 Nov 2025
 06:29:43 -0800 (PST)
MIME-Version: 1.0
References: <11f3f93e-57cb-4a08-833e-430c3e458fd6@oss.qualcomm.com>
In-Reply-To: <11f3f93e-57cb-4a08-833e-430c3e458fd6@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 16:29:31 +0200
X-Gm-Features: AWmQ_blF8muciiGrb9A9klbsR--ZwTChrIhECaWJEKs0jBN0UY33C7_EWXlsXv0
Message-ID: <CAO9ioeXncb3KEZgJDY-paL6MYVi3K6uvAx3zm4KZn3N+O4J5Kw@mail.gmail.com>
Subject: Re: [GIT PULL] QCA: Add Bluetooth firmware for WCN685x uart interface
To: Wei Deng <wei.deng@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org,
        cheng.jiang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyMCBTYWx0ZWRfX1n8fBH47GysU
 KF+hfXlJAEgBVe+KG871uJTluakKTwmujKtOP8sjRJtNd+RHb5qngecRUCalT/hZzq04CRV3OaL
 asksbFm70f0DjepPPFXMR02of3i37CFNXsiOCSE/pcSBvPFR3rttgSAWKUK+glaWyA7tjUhh/cV
 qzaU6RR5TnSsW8Z0leACCbZcsGxN38zQrlWQVVRY1ABL6Cd3rWtVtkDKjZPYzuDpC5LNCZXHIj2
 9UhmZ21cKoEGMYYOJrF29bpeetXSrUvuT9DaPiSRmBVaKzic2gGfkHZe2tH9rE5ohtoF0ZDURqZ
 u9L974PkP8pqk+IMjTHAzV9OAY8iesVrFnivBIBwnFa386VvJUQ2jUTKzVxqGbr7G5gj9XcSmEk
 KoZqbsMtEE54cf2FzCgx3bBs57Bwzg==
X-Authority-Analysis: v=2.4 cv=dZyNHHXe c=1 sm=1 tr=0 ts=6925bd59 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=p0WdMEafAAAA:8 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=utj24DIxTFXXsKSoAPIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: zttxFc5o3V7vHbGKSaUcUapzDHTjyaOi
X-Proofpoint-GUID: zttxFc5o3V7vHbGKSaUcUapzDHTjyaOi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250120

On Tue, 25 Nov 2025 at 15:11, Wei Deng <wei.deng@oss.qualcomm.com> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
>
> The following changes since commit ff6418d185528bb9b040de1066c34fa405ecd4bd:

Merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/802

>
>   Merge branch 'amd-staging' into 'main' (2025-11-21 20:17:56 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/WeiDeng-weiden/qca_btfw.git main
>
> for you to fetch changes up to 7cab51a8c025805e43172c1bc15b33d2258789a1:
>
>   QCA: Add Bluetooth firmware for WCN685x uart interface (2025-11-25 16:14:14 +0530)
>
> ----------------------------------------------------------------
> Wei Deng (1):
>       QCA: Add Bluetooth firmware for WCN685x uart interface
>
>  WHENCE              |  33 +++++++++++++++++++++++++++++++++
>  qca/wcnhpbtfw21.tlv | Bin 0 -> 152784 bytes
>  qca/wcnhpnv21.b10c  | Bin 0 -> 6618 bytes
>  qca/wcnhpnv21.b111  | Bin 0 -> 6618 bytes
>  qca/wcnhpnv21.b8c   | Bin 0 -> 6610 bytes
>  qca/wcnhpnv21.b9f   | Bin 0 -> 6610 bytes
>  qca/wcnhpnv21.ba0   | Bin 0 -> 6610 bytes
>  qca/wcnhpnv21.ba1   | Bin 0 -> 6610 bytes
>  qca/wcnhpnv21.ba2   | Bin 0 -> 6610 bytes
>  qca/wcnhpnv21.ba3   | Bin 0 -> 6618 bytes
>  qca/wcnhpnv21.ba4   | Bin 0 -> 6618 bytes
>  qca/wcnhpnv21.baa   | Bin 0 -> 6618 bytes
>  qca/wcnhpnv21.bb8   | Bin 0 -> 6610 bytes
>  qca/wcnhpnv21.bin   | Bin 0 -> 6610 bytes
>  qca/wcnhpnv21g.b10c | Bin 0 -> 6458 bytes
>  qca/wcnhpnv21g.b111 | Bin 0 -> 6458 bytes
>  qca/wcnhpnv21g.b8c  | Bin 0 -> 6450 bytes
>  qca/wcnhpnv21g.b9f  | Bin 0 -> 6450 bytes
>  qca/wcnhpnv21g.ba0  | Bin 0 -> 6450 bytes
>  qca/wcnhpnv21g.ba1  | Bin 0 -> 6450 bytes
>  qca/wcnhpnv21g.ba2  | Bin 0 -> 6450 bytes
>  qca/wcnhpnv21g.ba3  | Bin 0 -> 6458 bytes
>  qca/wcnhpnv21g.ba4  | Bin 0 -> 6458 bytes
>  qca/wcnhpnv21g.baa  | Bin 0 -> 6458 bytes
>  qca/wcnhpnv21g.bb8  | Bin 0 -> 6450 bytes
>  qca/wcnhpnv21g.bin  | Bin 0 -> 6450 bytes
>  26 files changed, 33 insertions(+)
>  create mode 100644 qca/wcnhpbtfw21.tlv
>  create mode 100644 qca/wcnhpnv21.b10c
>  create mode 100644 qca/wcnhpnv21.b111
>  create mode 100644 qca/wcnhpnv21.b8c
>  create mode 100644 qca/wcnhpnv21.b9f
>  create mode 100644 qca/wcnhpnv21.ba0
>  create mode 100644 qca/wcnhpnv21.ba1
>  create mode 100644 qca/wcnhpnv21.ba2
>  create mode 100644 qca/wcnhpnv21.ba3
>  create mode 100644 qca/wcnhpnv21.ba4
>  create mode 100644 qca/wcnhpnv21.baa
>  create mode 100644 qca/wcnhpnv21.bb8
>  create mode 100644 qca/wcnhpnv21.bin
>  create mode 100644 qca/wcnhpnv21g.b10c
>  create mode 100644 qca/wcnhpnv21g.b111
>  create mode 100644 qca/wcnhpnv21g.b8c
>  create mode 100644 qca/wcnhpnv21g.b9f
>  create mode 100644 qca/wcnhpnv21g.ba0
>  create mode 100644 qca/wcnhpnv21g.ba1
>  create mode 100644 qca/wcnhpnv21g.ba2
>  create mode 100644 qca/wcnhpnv21g.ba3
>  create mode 100644 qca/wcnhpnv21g.ba4
>  create mode 100644 qca/wcnhpnv21g.baa
>  create mode 100644 qca/wcnhpnv21g.bb8
>  create mode 100644 qca/wcnhpnv21g.bin
>
> --
> Best Regards,
> Wei Deng



-- 
With best wishes
Dmitry
