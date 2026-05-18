Return-Path: <SRS0=i9oD=DP=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607E8CD4F3C
	for <linux-firmware@archiver.kernel.org>; Mon, 18 May 2026 17:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 38F4AC2BCC9; Mon, 18 May 2026 17:42:35 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C28EC2BCB7
	for <linux-firmware@kernel.org>; Mon, 18 May 2026 17:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C28EC2BCB7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IH5POD2082314
	for <linux-firmware@kernel.org>; Mon, 18 May 2026 17:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q6TZ3B/ZoY1f3hF5PrRroTUb
	i0hr7mlWXvDm1qmcZHg=; b=S7jlGdbBtQaWF8uV8YIEt4NifkwSsg26c7YCFsqR
	sOHu/mxMz1RAeO76Bjj0shvUtf61sf5OHVmcgPX9+OJi4wVpLdHTG9J2k7LXEi9E
	dmrOAibyXBZoVqpyoMpwFKyIH4CuO2iZ334S1QSL3QF/Z0PzTQ+VrOdR2hcDTNg+
	K3oRiBVvOgbPmYfzez0Y32h5qr3RP11GjzNByvSIyqvtPZtE/FeblY0EIcGrZNO2
	sk/YzJD8i/LFkFCykYounap2ZE9bVr3WxO2TcXwYQYFeaG16SLSTt7OkaXk9DB8I
	FEZ7wku41Ac4dQkUz03GdCOuSoOrJ/I+ik3OM8t7J/T4iQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81ch9md2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 18 May 2026 17:42:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba838d3fa4so26175145ad.3
        for <linux-firmware@kernel.org>; Mon, 18 May 2026 10:42:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779126152; cv=none;
        d=google.com; s=arc-20240605;
        b=Z0c4fwkK7T+u9UlzbTDNeK8vd+wp7uIJhx6X6U8C0M7TRchl9ofenqCu7NR1UymQhu
         wIA2VUTh9LXMLAud0flDEq6DuYLDODOSVkhZZPgi/yT4h87sLQ3KxBYh/mbF9j65qxCo
         b6iOqepXSvyw1zsfOuo4ICahmI0JgVOOna7z3JSNn0YNwMOvjBXnj0yaRS5NEZ5xuWKz
         3cvNORQ31rG6oSB1qb1nXtaf+asL2IufzrY51diRPHJ+H+E9n4sIigGrgFohGD2qP7bQ
         UCPhnAJzGww7rHTTX+cDtTZmDmwbGJ4MEDjrzQo81usOUgk3EN1LRDFaH75lckt8JPZf
         /iDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q6TZ3B/ZoY1f3hF5PrRroTUbi0hr7mlWXvDm1qmcZHg=;
        fh=62tZUuFD8zmC58yWj84f/RiwrEkU9WJ4Vdk6NLs/W/0=;
        b=Z/CK5BBqk7E64T5Z9pcPIm6DzW7dSJJpK+CoahNaG3BZglzbeRVrmNdUUPZjf692Bn
         uCuxQQRCVSzsNODeqfGiSQVx2QeYUJ2m115TM0tgSJtg3Vxi5HjsUEI7DJuhCa+/hngE
         zilpx4zWVjcPgy9mITVcSDY3tTB5knE0ZxlS67LCrWYcu8AwOJQltQaWofUeOHjT6YZy
         2O8yukG5nhJbwCN1fYuSiyAWtgBEOGhC1/o8a0bUVtLndWwFJaw95Ta19lgjzIcm6yWd
         QpBdZLfGDWCsGD0VDSZdnP0zSNBrpXuJZbb468TC3hkxLKoFGr/v31TdbIkpygJA15vT
         ucxg==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779126152; x=1779730952; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q6TZ3B/ZoY1f3hF5PrRroTUbi0hr7mlWXvDm1qmcZHg=;
        b=Msii2qu+AcEdfKAE2FUYbPSg68Zl9cLc0MaR+Yp6m5q9ydkn748dLRBgStW7fb3TJD
         m6j85Fe+PIteitleY42xUGNZaMjOLDHULUBJPxYv13l8QJKw5oPClUginp/oembLJEbb
         6s/x64GlklU+KQGukTfeZqTcH3ZtkdKprDhAf1QpOeSHzLiaKAH+4d/6k8ktZ4c7lSOs
         8UsMeqZ3hERieIZQnrBrN3IP4H3LfvUG6Ly+8rNOfUpxDrFB/WchH+rbxBoKNAgzoBYp
         VTeUOSIPuH7m0NP7Vl/91HC7vCr+4r2+iaqzAaKLOe9cieWtn+Iu7yarOT+0ePcZEdPS
         uTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779126152; x=1779730952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6TZ3B/ZoY1f3hF5PrRroTUbi0hr7mlWXvDm1qmcZHg=;
        b=LntTFFPOO3b1L8ttvSCCDC/U5uHAn4htzHNt5Dkny0zCUaRUXnYEaoPcjxGodA0Fqp
         0/ADaHMJ8c+gQtCADJNWQfq2Ruz6PULdQx8xWxX7zQZ6wLn8snPvBij2FWjWuPCvgQiR
         0PGontZdKx4kAZQ6y4byqyh8UFFddzJxYVqfXXLZ1P9RquNC8lI0pPjJAo2IJKkCTDWU
         CkDCfkoU0hVKbsUMP5KTgl1bwq6rYLO3L6NqnDudjzKsH0yiPOI6ZuK+orWrzN+89VdJ
         uyt8z5Q+MrB/pLgyGcTg4yWZE5lJkbCszOY1caRUFdDZfoSUPiQwyEKzLdctYLeX8iwL
         ZLIQ==
X-Gm-Message-State: AOJu0YyPOafNmY7TGMXESMf88leL/ilbUBvqJP1ThzdGFf4WnsqdMm6l
	5KPGQjEn7UHs8CWYC32GTovuYNVK7OkKggKbB0tmQWP9FjIuBJ5nicl/wYkIlyvBiAK1xLawgT2
	PjWlsbz27n/m+8tWvO6rCMvds6U8iF3LJ937etYFEvOJOBk5PLSSpSByxMsFAlkyAp0Ikr//KZk
	kXCeouQ/BBvqIrBJKxKrWeqSbfQlLDhsbcep6YZQ==
X-Gm-Gg: Acq92OEGS6M2XhvS5fZEasp4HX4tRE9Pi1VHqQxT5rSIFpaTz9STc1GWufzgvZnWyuc
	RmjLjVtrIzuogFt1aOBHL56HHhg3Xl7lsyTHKbsJ2hxdFkF2+FRtFTmQbck6+nxo1ICfIYqxaET
	4y6S/QXiC0fA+wsrSSNAc6o2i3D1hL+nI0sYqHdKx2QzBun5yv6kJ8/njn2CIsE5rzXddCenHji
	6y90tAB3/qgDOca
X-Received: by 2002:a17:903:182:b0:2b9:cd2d:6f11 with SMTP id d9443c01a7336-2bd7e8bd35amr170683855ad.18.1779126151815;
        Mon, 18 May 2026 10:42:31 -0700 (PDT)
X-Received: by 2002:a17:903:182:b0:2b9:cd2d:6f11 with SMTP id
 d9443c01a7336-2bd7e8bd35amr170683635ad.18.1779126151249; Mon, 18 May 2026
 10:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <e604d18e-48b9-480d-8693-625009082c39@oss.qualcomm.com>
In-Reply-To: <e604d18e-48b9-480d-8693-625009082c39@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 18 May 2026 20:42:20 +0300
X-Gm-Features: AVHnY4KapGanVf2zxBdPExpTI8q1iwMYEuUetMqI7v7LGXZ9UT9Y3dHFEyP5VYI
Message-ID: <CAO9ioeV-AZD0pG4p2sicbvVsXbdEeFK2tUL4dq95Fd7LXH668g@mail.gmail.com>
Subject: Re: qcom: add CDSP firmware for shikra platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Saddam Patan <saddam.patan@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=a4MAM0SF c=1 sm=1 tr=0 ts=6a0b4f89 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8
 a=JKDbj6xnltVTqqTr6JYA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE3MyBTYWx0ZWRfX/+V0kTRnSSgI
 RkR3pKfk76MvoQ+PD/7S6utkwQSXKgbf08vY1XPGmND2D9WQAMC19ITSPnZlpBCtdK3Gxcm/mUE
 YkTPOhdWmqh7D0RLb6f5/nhQG5qnBBs+FlwyeYM4rUaeL2iPj8ARXTqBTadsBv1bA28YENWfJXG
 I1y9KInCIcRZnYfyXvUP0dVtibPeykkx8f0/A9/F2Sg9mLq6EphLWuaWnrwDUEbN8YVSzwnqocc
 6T3Uw2cTujLTdv82UwI1cI2GroCtoGkOwANBSc4w24NL92nhgGpKqIV+KVdkNYaGpIZuG44QPK9
 655Pe6PKUWIdP+Qa6BCuQl8pVRTQT6JbWOQe5mtTY4Wn4w/CCSKMBqW2x6m66KW/XNVJpOyYlWk
 2Scm6HmugTXSL2eik0jqgobhmTzh4Cx3qOiSLOJRhiJU43sGxe2pmvQGmEZLpp6ZR1muzzgAZmZ
 a+/3ipBrrCKPhPBRXlQ==
X-Proofpoint-ORIG-GUID: ADFOljtp4Bynsg6IXVJhin4d8vQhjAZa
X-Proofpoint-GUID: ADFOljtp4Bynsg6IXVJhin4d8vQhjAZa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180173

On Mon, 18 May 2026 at 18:38, Venkata Kota
<venkata.kota@oss.qualcomm.com> wrote:
>
> The following changes since commit 5b2bc2e7d14c56e14c59a3d6e7b5b0641dc45c88:
>
>    Merge branch 'robot/pr-0-1778742898' into 'main' (2026-05-14 09:15:02
> +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-shikra

Thanks, merged and pushed out

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1054

Don't forget to submit the Hexagon DSP binaries.

>
> for you to fetch changes up to 72a98ba4050396822df153ed47c45963ded3bcf7:
>
>    qcom: add CDSP firmware for shikra platform (2026-05-18 21:05:42 +0530)
>
> ----------------------------------------------------------------
> Venkata Kota (1):
>        qcom: add CDSP firmware for shikra platform
>
>   WHENCE                |   3 +++
>   qcom/shikra/cdsp.mbn  | Bin 0 -> 2614680 bytes
>   qcom/shikra/cdspr.jsn |  22 ++++++++++++++++++++++
>   3 files changed, 25 insertions(+)
>   create mode 100644 qcom/shikra/cdsp.mbn
>   create mode 100644 qcom/shikra/cdspr.jsn



-- 
With best wishes
Dmitry
