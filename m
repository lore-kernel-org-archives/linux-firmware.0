Return-Path: <SRS0=RSEr=AV=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79EAE909AE
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Feb 2026 14:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A13ABC19423; Tue, 17 Feb 2026 14:55:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A81DCC4CEF7
	for <linux-firmware@kernel.org>; Tue, 17 Feb 2026 14:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A81DCC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8vqiC1601378
	for <linux-firmware@kernel.org>; Tue, 17 Feb 2026 14:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qL4THCMu+5zDzFvqRtNmWduN
	q9p+ApbK1ICTRU3h2rg=; b=A4+TUqHwl68tW8UPsnOsZLim38ZIPG2uK1O1wT5M
	wxBjF4OynSx4SlHs3JzkWc0qlDyZVsfoe+7VZbjFqrRnE68hkkJ4oS8nQ8mVnxON
	V0vlVgat9ptcg145M/hArDq2E9OFNUFXwlCXBRiTFLppy0n6SaaeOae3iZGYLQ3T
	fekMlFUk09Y3WeCWSa6QLNpFzHCwIcSrlRrxKwp7QxaFmRqHdhJlPlMTpiBVL/HZ
	+IeZIunsWqalsYg5t/I3/t+mMc3v4SgU2H+jm0xZxZkxbEr+NDpXdb8EkvzMLpXD
	/DowtnbupL/nVEKPh2R1f2ZEeam05tX98HiMK0PtEBvMEA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tmancx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 17 Feb 2026 14:55:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb413d0002so2810550485a.1
        for <linux-firmware@kernel.org>; Tue, 17 Feb 2026 06:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771340121; x=1771944921; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qL4THCMu+5zDzFvqRtNmWduNq9p+ApbK1ICTRU3h2rg=;
        b=PSFuwkpD4+JWWb4JS2tWZ0cSzdoVrC6kb6fUxLu8PUPhpxmg8Ui3UuQK2aS3PdS9EN
         hhmGT9i+ToZ376OY9sCtH2Vc+g9OXvzqFGL3PjqlaVc99geSgC+0hrKwE4fijkGS/Hb0
         FkO/KhSqWRgtK7c8N5N51P6O0KGpkDoTQly4bVnvNlaTx33MSN7Q3XMdnVW9dw8+Y3Zc
         vGN3U2vOrhEahgZI1jFEupr24dPQIbnbBxIBGT7IQVKqDQv7/RkOjpfmek18eV+mK6sU
         wgRBja2cJ/O0S+AlY/D/ZRnPxAPHPSCkMc7J9zcZ+8ATZSJJQg4SYDFnU69Ii5NN3f3M
         R2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771340121; x=1771944921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qL4THCMu+5zDzFvqRtNmWduNq9p+ApbK1ICTRU3h2rg=;
        b=ND8mbqGz5rkYK8U4w48pFFQbXMgMX4YrGcTihdI2r1N+VFIm5g8gU4jS8eErqfuO3W
         PIS/JX+LbrENhXZJ/3kevS49Oyy3wy0S6bpJ1P7lqdwfIqi3s+P9oCZZ0vDJS8ei+XFu
         2hAm4otfr7Xi4FS27nV4jt+HCSUMlG0j/2FtURKHtfXI+gK4gbn1tejrBi99TQCgwoDv
         Ik3B2acM0qu0C+prwcnkXSTD2OgOfcK4/7Mac/HYMW9+SFnDVvNI81b869xpOrGutGiG
         vJPRbopipb1g3HSEQFjwkhQWtnvUazDOH1tF5J0fBZCjY2gIb0ISUhtTZaWy4UDXakzF
         S80w==
X-Gm-Message-State: AOJu0YzQbj/s43G2+xOR/Ve/J1lvTWmZGu2s+3bsDHkG58hZ4ce/UKLd
	PvNP+kOi1mwdPtSTm+H7qq34FTFftGs05s+ph63BIjfzOM8qAr8DaUtcDjqClOPaUB+Mx8oKOXI
	VWpFZrL05/VSEvX8P9yZnT+AfEKvxcxQta3qII2VDNEl1dP+IzihAkNmWWdWzC8E=
X-Gm-Gg: AZuq6aLmBgmGVfZHseqi2nMAnab4q2V9gkp7FfmbvcXz9G8yyiyFeilCoUWMZ7XD0VD
	IEw0ZlVgDLuw4RVd0uCJbpvvuB+zst8KMS6QoZbbChCzaopeEktWCwBdjKRIY5qOgqaprpYeDq0
	ZmqFJEXreFDdy7guFdfSDdoGcad/UPQ9KjbiF4hm1lEqQoE02GfJ6X6Iz7Tqe8kyaREXgmxcPfZ
	az6GD8DGv0d2FqQO5gXdHvjixHjyxoZ5PRFsFwYHWDaYo7iYvEUPx4RsYloAbpKZVygK5/7OULc
	x83/zx1t0/2y440Ryu1HA1U6EHCmbqw7rNsuV5jytu8wR/9aSP6fdGscycG1IGYaDOPMa5QJ/DW
	ulrMCIbaUrn5T2zxWt70qaWOEpFuf1wm/k3+muXeXLGaOkos1804xv2sik6RnQ9VFFhhyKMjdx5
	eDVBafq2hovvgohLfDSkqb5HUU7ALZmfqDh9w=
X-Received: by 2002:a05:620a:4690:b0:8cb:3143:64cc with SMTP id af79cd13be357-8cb4acb44e7mr1303773885a.42.1771340120760;
        Tue, 17 Feb 2026 06:55:20 -0800 (PST)
X-Received: by 2002:a05:620a:4690:b0:8cb:3143:64cc with SMTP id af79cd13be357-8cb4acb44e7mr1303772285a.42.1771340120240;
        Tue, 17 Feb 2026 06:55:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b6cb1sm3904618e87.84.2026.02.17.06.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 06:55:19 -0800 (PST)
Date: Tue, 17 Feb 2026 16:55:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, prahlad.valluru@oss.qualcomm.com,
        Tony <syyang@lontium.com>
Subject: Re: [PATCH] linux-firmware: add firmware for Lontium LT8713SX DP hub
Message-ID: <xnvt5hw7uxtvi4fpuqytnbg7s53r6is64kw3eq67i6roj4sgxt@mlizgss42vag>
References: <20260217-lt8713sx_firmware-v1-1-f78b85fceb63@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217-lt8713sx_firmware-v1-1-f78b85fceb63@oss.qualcomm.com>
X-Proofpoint-GUID: YfkzjMrAiNqR6yOHf5YC_QGghJkEndK4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEyMCBTYWx0ZWRfX7jGE5WBJbT3f
 4tbKIiMOaliRx5c7iZfx5SfLWObCJ2K2Yy1pnnxDmVkML6Tgfnxv99ccYQRTe740A23Wlc6D1r8
 oF884v6QBMx9+5r5SQioUqVALaKqdXI/TyPgCxoXs4lyJSNWcBPZX6exFsQdOe/SIiM+7bvQLHx
 R6jF2iAoRPhgWjfFRY2hib8MtT23gkJyhRMyeJJ286YoiSdliq/HSsMXMfzOL2qzpjX7Paoj8He
 8LsEAskadxkKRsEehdKEXaDL3jIqqRhJMgAFn8VlMAXczDcmP1SoJ4ib18enAvH+LP5YosNnJCA
 YOy2R+RDEVLBpn2lenie8Yb7hf/03qYtk9pEMmsvUsSe+rnt8t7xL8xJ36eZ0+GjLaxM6Gs6OS5
 UGhH2ULCpaSQRAZoHaery8ZQQ+MJWKXyPAMBalLQDim31ZUNY+Iuedc6lU2ISox36Tc9rRLZs0h
 Ixqdn4COrkZhCaYcK2Q==
X-Proofpoint-ORIG-GUID: YfkzjMrAiNqR6yOHf5YC_QGghJkEndK4
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=69948159 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=Kz8-B0t5AAAA:8 a=pJ5T_fzTL_d_e9eUH7UA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170120

On Tue, Feb 17, 2026 at 07:35:41PM +0530, Vishnu Saini wrote:
> Add firmware V667 provided by Lontium themselves.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Cc: Tony <syyang@lontium.com>

Would anybody from Lontium also sign-off on this firmware (can be done
in a reply)? Just to be sure that Lontium is fine with the proposed
binary and licence.

> ---
> This series adds LT8713SX firmware provided by Lontium.

This is not a series.

> ---
>  WHENCE          |   8 ++++++++
>  lt8713sx_fw.bin | Bin 0 -> 145976 bytes
>  2 files changed, 8 insertions(+)
> 

-- 
With best wishes
Dmitry
