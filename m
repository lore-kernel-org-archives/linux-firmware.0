Return-Path: <SRS0=par6=EO=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E62CD98ED
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Jun 2026 09:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC58E1F00A3A; Thu, 18 Jun 2026 09:39:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1781775576;
	b=blLtiNXlt2JV9YVGoW6VVdb/exHiEdDvWlNSnTbLvDTOobTHNfJ5JIboVfee+AX8/m8Q
	 jS6gf6ilbYHRQy4eKWtHtipQ1Gmb08BJQLkRITDESUPX2P9sYz1NVVdSC+M+mRiQPzII7
	 Aey4fzn0rEtb/A5J4/ZFozfQLA1Oq0zHn9qXAXFo2jZEdKARtdssAO4Y0wgk5XCzlxS2h
	 uplZWPUAsy6D8UKi+WGbyJiAf0O+cJKvxlKTNb8y7IlumlRSGqjlbVvM0dQeae9KWcwsf
	 U77tDXzJgCR8i8czGLltUC46PMkwSXrwVb7dZXiv/BjxUVxYEf6U7HpgrVOFE9XV4pA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781775576;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:List-Id:Cc:Content-Type:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RIXCVl7n0JDahjIzUnDFfAzwGOOWG+jAj8vreNf0y8M=;
	b=PrdlxCUOag2edlMeOmyWIWz7njaGcsnEJ37X8wo32V9Vh+/NEXWpOvxzAs8rt944ujk9
	 +4Y/QKfesTDH1fZnRss5oqc1XlNrQVXH6ejvSuQtBr/yc8TQ7fLTf1Qg5/NIV/U8B0z1/
	 5m374LoVVTtNB/i/A3VW3w72IMZwDVfb/VFPTbSsUTCRwTTt7qR8p6EAa6H8bKAKNkZiv
	 av9Wi+78sCflostdmSHoLmohw0KO5Y0OAuh7kgDKlYh71iCx0KNn01sHLy8VJAB4nDI7T
	 5RX7SKlN0XcKmeBiVqvZzENRKwBMB9oLvzGyPVdLiB16Ov42wKF0kCBrdSQUtU+n+xw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IlPtCmd5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TjKonw6t;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 54D021F000E9
	for <linux-firmware@kernel.org>; Thu, 18 Jun 2026 09:39:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IlPtCmd5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TjKonw6t
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 54D021F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8DxFV572751
	for <linux-firmware@kernel.org>; Thu, 18 Jun 2026 09:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RIXCVl7n0JDahjIzUnDFfAzw
	GOOWG+jAj8vreNf0y8M=; b=IlPtCmd5Wiz5Gqxl9T7Gcph4By0N0VB03droybkw
	WHYd7NAkwYZFyLGRHgNm/UMt0VrpR6EzuajzLzE7YmBBIKS25KgaEQ+tE3/QA3cr
	X1GpQJRFvpPx91dLAJ5dmDnik3px27UTzcpzy/+Ble9FC1zxKiawd9Wmk1gH2iuW
	9g+o+xnu8ayk0Ii9Nt+yHZ1ReNLxC6nICu3nb6NGwjPGWgINApSxZUOWJAF84lCR
	3h5JxiMCyNdKlybCF+53BbxMLI7+7wdVtTFYeDmWcRvVzIzz8kUBvR7vgWZA0CnS
	BNYXQoDauK0v9DOHEXjCt1aIis7Gl6q2Q7M1nlgdnTbG3Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euxt53nf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 18 Jun 2026 09:39:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2beff6b6e74so11902835ad.1
        for <linux-firmware@kernel.org>; Thu, 18 Jun 2026 02:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781775575; cv=none;
        d=google.com; s=arc-20240605;
        b=WctqZvNJxUwkBipOv6x31Cx66mwltv0+U+xKZAY7dm0S5mwCZ2e7fhXwwjnPGNpa8M
         CWvRrLgfOWYQi7pOe1finVUVCFmuI901u7CzIrBNhNseBtAm/kDFi5fTohSA5kKiOevq
         onJFINEtDrj1phZE1D+arLXhAkLGhUXFiiLwDcfQwzsBVzeNyUufKF1eNcQswYYV0hP4
         15+nzs1vuY+pcARA4AyDVQ0kmpJP/l6tXgU11wdP7sd6bFP62OQn0nSxHKTlq9/Xvapy
         eSyQgovUWgRXNzPR/9VwnhQHkGzp9AGX8mmZlANyXSBfnn/WvbROgKJXUK3pqQB79mTg
         l8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RIXCVl7n0JDahjIzUnDFfAzwGOOWG+jAj8vreNf0y8M=;
        fh=0hZIwwxU0IvdnU3puZRSUu8SPP/I17IT4iH7elxaJEY=;
        b=clW/HShcs62VM/3AQcVqOMCdvBDvycnMZOqDaPod6eVBOcsPNK32oIuEm0yEQ7bE0r
         dtcxgyL986LMONMd5Cnjn1bTtAqgSUPXyzZ4JWL903tUwauGrRho8LTC5wisJoLt0B4S
         VgrwPPqbgrAYg0/UZFcFAyaUH+/JHp6GFLPYDcZafRW40JD6Jf/iOxkCcFDaQiWcqUlV
         ZpJO6psrwRd1beumfs4j9nLFzq0yKkb+mxicyfN2pcpTUFxT76NFTxhhrF57Pq268mjX
         XPYGXGAdHUNFBwZ+OelsnQeeDAwg/4tCG6Wlfo66/Nh+ZmI3nC/B+3udQz0/TNPcbKKM
         /ghA==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781775575; x=1782380375; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RIXCVl7n0JDahjIzUnDFfAzwGOOWG+jAj8vreNf0y8M=;
        b=TjKonw6tCjbsgABdRoei0eirI3YXfGUVebd4vHSAPP+BqN+sOlQTu0eQNNPtJQs3qv
         mnSRsstGXY9ZbHwbSmevtesOdVC/Liv7Q5hfu+9zp1UP7ghmGwzuFP+46XENkxEAhIBY
         6rEZLsyCo5jV8dLY9IlukOBgUBizvgPz+5iByBvNJh1P47eiReU6JiGX36c2zYBXXFWj
         UcPka2EU8vja1S+TgukETLl6fSGFX/2W4Uu9qvcsDYK6LU5uSN7OOvi4wzYR7VLgbbX3
         K3LBc6lsZFIaEZfzpk00MFRjSK0cbjwleRCY6RZf1Dc0jS0rsjJY1RvAyfYozW6fESRf
         Is4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781775575; x=1782380375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIXCVl7n0JDahjIzUnDFfAzwGOOWG+jAj8vreNf0y8M=;
        b=iU+XK67CwTKs3lSfMJu+BWlq8GrcZOZTDO2iEpIelBH2+DTe+MVhq1BKf1k3WpyVFV
         oupGDoG/V4g9pjrZ3X4aMhE+1GulQN01tP44EfIgCDl+YdZxtnbtOaU1YBC3ujyp49pL
         dokKfaUDVy7Vl6ncW85luIx8Rq1Y0fDaTfd20D92mcJmOQ0GaQsc39hGz23a6lNPoyjt
         6KLIVz9xgiBqnUysG4YDlgcdalwTA300ZVmdubHT5xV1vvcBdStRMFfbYpLM6zGZQ9f+
         +Wy/NJpP8BEbkpnW/wYYUajC+RfvhLJ1VROA06zm8VZ1QgD4yP/5/y+leBoeOLWVGHoC
         cfxw==
X-Gm-Message-State: AOJu0YyiIobxIah40H85Xz3roF2E7VQDIP3a4GMOr2BL6wwP3gsqzMhL
	RbbuRhCVvUZ1yS2FwIEbwa2SHuXoYLmq/qSmtfxIdWKBVJYRUJ24TjLAxoMflKcRO5X1QlaQghI
	Aao41XJsaL+A90YHb8CoX3gTciWyn1sM1JOqSQg4hSt51NltUT6mMf+Y3pZtMlYm+i73cDZaN5i
	Sh690pKKcU9qmgf7FxF1Hbvecj9tKQ0ddpYLv2yw==
X-Gm-Gg: AfdE7cmzX0JxNFhaQRZgH01Cwrq2dE/wKBURqADaDDfHfJFrIxp1ilhLVdRI0VlEVyG
	xzt/I0H5gKFPlqYPId6SptESNMTdQch7oJmUhwWbN2uTWpbk8u6SRQyLW+zohjXYL+1vNvXTHDF
	aob5E6btFXv2kjzuVFfFoMelqkMLgajkRnnrn3MbbanJsfytJlLKshktEOw80MXYovfQ+iCWVrR
	g5CTMrxWbkFj4t8clNUqlQrJshtQQ==
X-Received: by 2002:a17:903:3847:b0:2c6:b3dc:b82a with SMTP id d9443c01a7336-2c6bc22dbcdmr80066175ad.24.1781775574654;
        Thu, 18 Jun 2026 02:39:34 -0700 (PDT)
X-Received: by 2002:a17:903:3847:b0:2c6:b3dc:b82a with SMTP id
 d9443c01a7336-2c6bc22dbcdmr80065655ad.24.1781775574027; Thu, 18 Jun 2026
 02:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <9b75e904-0b63-4478-88ec-63a9b15a4d9d@oss.qualcomm.com>
In-Reply-To: <9b75e904-0b63-4478-88ec-63a9b15a4d9d@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 12:39:22 +0300
X-Gm-Features: AVVi8CcrwOdWbOW_sMo9zutOOq98XSd6_Q82RHuaonyfWgmAI6m5IhrIkopV1ZU
Message-ID: <CAO9ioeUQHi2bcsFEpZRYDfFK4K3U=VhdEqz_Z33DQwBi0P06aA@mail.gmail.com>
Subject: Re: qcom: update CDSP firmware for glymur platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: zBDxpyMlU1iw0e91T1tWG0f0qs_wd6iM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4OSBTYWx0ZWRfX/f225GZDID8m
 ah2tdjd3iB894PSJIPF1DogPppXANNGpD1G5Q+8VfuL+fmathA6+VGG1cZK8BKu3wUGLwdwxKk0
 ATBAiXSgGic30KvJnTI4jo0cVwt5WL4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4OSBTYWx0ZWRfX3UNt0LcfIVBq
 MC1hdJ+XFLNhno6wjtapnPe4ptOvYvQddYxqgUs7jbRNwr0NHYec59kJOJVECm1XwuiJL+QQWFA
 ORwoEkPdlqlR7JOSzm4GAgwrrnvi4BQ+rDY4wE6/UguIWj1egu6RPS7FPcnm4ZGq0LgWjuEHXvj
 7bSfLxDw2Lj/v0S5ny5D+1S27f0CJlSJJb0JPSuqt+KOyqQa5IEO5ZqU783jOylmfnPnlQRnzAJ
 I1x42MIA3uW4aEK4Zq1aZiJnlvija/8JbTo4WRt7PScvaS9Q2raTwM2n5tQI6RLSif+LvPjyJJ/
 7SBzHi6Pe72WdOXnHl+aJr8THhiRlw7I+QzIHsQXcF26mc58FfINambmNQa+6Gf8ZR17MydiVra
 fBPOeNPo4WUaz6keR8jVUpH31kTH4D+3iSj6JUIC18w8g+zva2HE4mAiWEmN3y9Yu4XmssjBl46
 iZ5UaAycOhkZLne6c5Q==
X-Authority-Analysis: v=2.4 cv=PMw/P/qC c=1 sm=1 tr=0 ts=6a33bcd7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8
 a=xnvxTeG8PABeuHWFjgkA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: zBDxpyMlU1iw0e91T1tWG0f0qs_wd6iM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180089

On Thu, 18 Jun 2026 at 11:34, Venkata Kota
<venkata.kota@oss.qualcomm.com> wrote:
>
> The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:
>
>    Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39
> +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-glymur

Thanks, merged and pushed:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1109



-- 
With best wishes
Dmitry
