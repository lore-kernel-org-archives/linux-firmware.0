Return-Path: <SRS0=m+mA=AZ=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BA8C5DF6B
	for <linux-firmware@archiver.kernel.org>; Sat, 21 Feb 2026 02:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7917C19423; Sat, 21 Feb 2026 02:38:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99E24C116C6
	for <linux-firmware@kernel.org>; Sat, 21 Feb 2026 02:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 99E24C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61L2XoIG1220943
	for <linux-firmware@kernel.org>; Sat, 21 Feb 2026 02:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ID5PRIuXIG4cMqGiUsEN5pM9
	hr3uTTAgkhzEdjSK98M=; b=Vk4Bpbi95SBwXZfO11EhPTxqZ2ygsnmaeTOJ1kRs
	BuE6WC+GyulQfiyIVHDKtKokM9OcsAAL+1M6gBrgjtXdU+qRc2F7YKNoj4nTuGia
	XIQIzuaVVuFGzLSnhCbp0fo70A3rGCv07E3APX9hf9jWp66zPGvMTuhMGUYWimiP
	8EQUyzZwwVw0kvRYtbEEOYftx4SAR9xmobrce5xnivvpVLY9pYPoS9sSgLECkeo8
	QsNg63fVMTUqsvhD4n7JeJK6zA+sR823lL9/R87Ukd1pkYp4jd2EJcZrw5TUpABL
	JpzhFYucFi0RzJEG0wh/2YNQEE5gOZ7QePHhCs+aaPRbEA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf41fr07k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sat, 21 Feb 2026 02:38:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71655aa11so3036911785a.3
        for <linux-firmware@kernel.org>; Fri, 20 Feb 2026 18:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771641506; x=1772246306; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ID5PRIuXIG4cMqGiUsEN5pM9hr3uTTAgkhzEdjSK98M=;
        b=K9UYxH3JPp/UcOCywEmSYBdL+q4ZGh/4X+3UpVTnuCHlfy/VFdfqYRdYu2knaW/nDY
         Y7xwIQBe7bQehVTH83yAMG6qiugMVFoAdTcJCl+I0YBiWT6pRVQO7VCMzaSoDt5L/dHU
         oOFYr9RG1MVXLbiPXJ4MJWOmpmO0DOPYrBdR3e4cIzThLxA5MCRCF/OmQAr4k13QoMc2
         AHQ30NmsYAMqlwAs8QqYFpeSxhGLwhLop3q4pFfwr8SNHIvMyiDF7T04kpiGqGq5ec8/
         7RfUI39+gElBCFyzO7uDepZqqe7hQS3b/etnYnWZSB+J6Zc/N58VXR/OgQo4hLi4y2q4
         SQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771641506; x=1772246306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ID5PRIuXIG4cMqGiUsEN5pM9hr3uTTAgkhzEdjSK98M=;
        b=CT+OV0HmT5IMsWzviFfKpX0wo+XD7DV1i6dr69vL5sj/sL7BGAmSNIgELbDRRTMpVn
         eRWvF/R/M5VWMdGXKAG2XaChr2K0X3mZp4tqjqZ1+GGKdvjytM9HxmuVGx7IzLDIK6z2
         Oy7sIgGcK1Sn60GJz6zxq4Vow7VlaSJudjPOZdlU3S8CEoTg1IrfPXrF3oTtcUTLQ1i2
         UxYcBEXSypPFX0SvK1MarRgL6zB3cAeLWpXxEj7QAD2Absl7d9Z+j5+iqCHyvgJtQcIU
         UpLEkKtiaszk8fgY/XSa0O0t3U8wtSqkxWp8thAY4HJACD3/WS+0T5o6dadMzE4eqdtw
         jIzQ==
X-Gm-Message-State: AOJu0YzLnNQccNJcgOVYh53e5wzxyEtgcqVqrZxYeMG3RSx9CJvL0EzP
	2gK1IEHp7Rgr58m86j/ei+bYYIaKxBDfB3zdkQdQbRsFzp/skekxiBFjPmdKhktOHJImtmw+4+6
	23wj8DO13Ag3Vt1MAepBATMve4vyUdqtg1rxUE2HcqvQcFoCbIiaHsgvYMUnZ7qW5uehVhUk=
X-Gm-Gg: AZuq6aIJ2jiG4XKEtURTD4ru4xRzJ/Z04NkEb9vad3CskfE+sg1fG0F70LGH1q1Klhx
	IXtTabG6O5oJGdUfmDkuoaniwUcT7Yfu3y+ypDC9WSxvWmBAGyzx2PXKCA8JnxS70FMyTXfg4aH
	SBfzkq8lW0QFgjeyJzBmJQoybi0UbTgoOW9hnX8L6rAxG3nL5u9nxPTYuU7ZN28rzwLENra6cDF
	M4TtDV0q3NlBZGvXbOzO5fVNJfGX2OmFgzKZirEfhJ3iFHJ4yAK3qtfRCYjd3Gk/X4aqAtezCST
	OnnFjWnRH+A2m0RPIavQ7DmvxT4DBtA0i1quY3b0+iL7/+9nB6aHDXmJaVBwcGRcZWd+tck4z0g
	YLQzAsmtBxKa6MpVCYqapZUYuOJmhokES8FPoLKQWnHDmlzxxA+jtDGYZQqFQ81lkVHSM6V9lMl
	XB9IZR9zKbXX6FeDytJmeWjm+HvhhX43o4N9k=
X-Received: by 2002:a05:620a:25c7:b0:8c6:d949:1d8a with SMTP id af79cd13be357-8cb8c9e6703mr231780385a.6.1771641506189;
        Fri, 20 Feb 2026 18:38:26 -0800 (PST)
X-Received: by 2002:a05:620a:25c7:b0:8c6:d949:1d8a with SMTP id af79cd13be357-8cb8c9e6703mr231778585a.6.1771641505648;
        Fri, 20 Feb 2026 18:38:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb4cbddsm167913e87.92.2026.02.20.18.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 18:38:24 -0800 (PST)
Date: Sat, 21 Feb 2026 04:38:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: vpu: fix SC7280 VPU Gen2 firmware and add compatibility
 symlink
Message-ID: <jsbws736w6thvyxueqeguz2lwtgfbs5j72fajvfgtjos5gvhmj@4zqli3nlfsaz>
References: <3d546c6f-f3eb-c012-db2e-89b4ff1f9f89@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d546c6f-f3eb-c012-db2e-89b4ff1f9f89@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 89aDjE6nnA36cP8f2FKAmSV-nWUMtNh2
X-Proofpoint-GUID: 89aDjE6nnA36cP8f2FKAmSV-nWUMtNh2
X-Authority-Analysis: v=2.4 cv=GOAF0+NK c=1 sm=1 tr=0 ts=69991aa3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=IwsA_6f1Nedn2AVYRhUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIxMDAyNiBTYWx0ZWRfX8FBWO6TBXJmU
 UVdU0s07Jw5v0sfL3HarhvW0xAhvwFXEFDCm7SJL1epaKOj72WjhOEUkdy3VdBjpyu9Mq2VRnri
 pVuCOlvwli/xmhObwwA5E7jndlx4MApBReoQuvvFdbFncKIaglPavH0COwWQe/WW2qQajHTqwIM
 b6RqFeNwBp3UtLK2YjF3vTi4vSn/MQ0oMOUhst+zgDgn52kyhDx1D8wZpkbCXvM4qOLs56dIhQp
 5dJ0de7x6PdzjYYS5UYFGWawPJEgEpz9HhMu9D+dQTSkCc+o2mqLtdQqpvSfMsAnMBKMM/x4NM8
 bsiIriGPZtZp7vHf8xr0DGHADOK+21DAHgsERfBAnUwn8CFpxH7KeT07mSJG7hhPC9k0sIKlxGj
 VXV8lO+aNQgXupymN3JIKk9JEH5uuMTa4Kv5hnQGyUM4PXHg7LYFUn645bZctZcdNt6LcpjMDM+
 ffDp33m34nNhlKTdbvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-21_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602210026

On Fri, Feb 20, 2026 at 01:14:16PM +0530, Dikshita Agarwal wrote:
> Hi,
> 
> The following changes since commit f2dbd7a7a74be0d309d8058a55308dcea33a41d6:
> 
>   Merge branch 'robot/pr-0-1770355730' into 'main' (2026-02-06 07:17:03 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-kodiak-gen2

Thanks! Merged and pushed out,

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/926

> 
> for you to fetch changes up to e1e281a6f3b7ac959eb13012020d19084b60ff7a:
> 
>   qcom: vpu: fix SC7280 VPU Gen2 firmware and add compatibility symlink
> (2026-02-20 12:24:33 +0530)
> 
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: vpu: fix SC7280 VPU Gen2 firmware and add compatibility symlink
> 
>  WHENCE                                               |   5 +++--
>  qcom/vpu/{vpu20_p1_gen2.mbn => vpu20_p1_gen2_s6.mbn} | Bin 2036328 ->
> 2030620 bytes
>  2 files changed, 3 insertions(+), 2 deletions(-)
>  rename qcom/vpu/{vpu20_p1_gen2.mbn => vpu20_p1_gen2_s6.mbn} (61%)
> 
> Thanks,
> Dikshita

-- 
With best wishes
Dmitry
