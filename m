Return-Path: <SRS0=N8LK=7R=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3161DD25030
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Jan 2026 06:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1AD15C19423; Mon, 12 Jan 2026 06:10:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 18D73C116D0
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 06:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 18D73C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BKGgi63839808
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 06:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BZeE9HyKNWs86vnnXq+XJjej
	QysLyHJ1l51ESf3xk24=; b=L6E+0LjQh4zwEP7n36FeLba2EYq9oYeOTgvqlCWU
	92sGPzXd8JXpqs+I+lox20oC2E/uWHoQtLhTJLvVNtbi9c6qfkgVj7I+WQaofJhQ
	DH9TC3NtmmFbRAtgddkLynM/Hcobg72fsyKwwLhm4qlneajFWaJNJRRyJAoOUeO7
	vzGK9xauWu/51xtjaU2VykooQdAiVT8JbkVCoRMtQxV5MJLET7LYG6t3+Pi+enR+
	rhlX3fcAmGu5FySRy73E7r9vykS2q9dqSi22CnfdwrWJvRwjqeZ/Oor8MHvzKrdv
	x1YYY24Ai4pNVuKbZEKrwE27h4hKq09eCkurB9D53NP6wg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkebu3swu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 06:10:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c52ff723c86so2207621a12.0
        for <linux-firmware@kernel.org>; Sun, 11 Jan 2026 22:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768198215; x=1768803015; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BZeE9HyKNWs86vnnXq+XJjejQysLyHJ1l51ESf3xk24=;
        b=etZz2o1946qQlN6qpiizPjaK5VB+cZzwrYfGSu53YmrBsqidjZxtBwBtmLCMc5H/AR
         TIBVwOLnjcICIquLlpDnj4rFqwhBsjobVwCtEhyXwuMwLcdLVsAvPEBFRN5XQxz8c+Lz
         3xo4yEfRqIZXsOANnpo79jDYdw1G1vcmoPe0cke3kUtmRm/o3DB2o0PcqzadppMkd8Vl
         p7ayYhOkMTP0CCuudsW0oJteBkvzHmUCaWj0lDhVK3TNYyT9fVjdpfzcCjzv18hGDdMn
         mFVkE+qKLfplhkVLSkJKf1/UAg4IreJopzmmwO9+byP8j82plmvppFcfxkz5yXn2wSK5
         Puzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768198215; x=1768803015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZeE9HyKNWs86vnnXq+XJjejQysLyHJ1l51ESf3xk24=;
        b=DLkwo6gdhmAa7d+a8KAZeWqWow9cEYclkmGMJTVcnlRh+6hK6eHHVy14SoF5xcXCT/
         ZNaob5ux8UlYTYVqxPoF6P5uobnAIdhtAWZdyyIXhIKrD/XXG4JLafJxIzj+SAlClPEv
         0/JtKlLB8s2pjCx5azYOD9ofOl+aeCQqa8gXC4Jxkb8JPmz8P1cW7Zie9IEhsCX/zevq
         5WE2LeC9OsAaQaUAHmvtOfUcmzNJnw+PjNkHStck5Uh+cly5aD2+BuHTIvuWVyleFJMn
         rdzQJ1+ce4GeckQV6swEPFVqCLzxc68FjXWL7Bf9DmSWpbW3hpopGJw70wX6hm6vkvFT
         FNpQ==
X-Gm-Message-State: AOJu0Yy/wA2nzpaW8HLDTUmsRKqDxDkmNz9XalID0Qloi9WBnYJH1rkM
	udSHbNfiKk0zYwQEGpAQRu5xaKNc8fmfHX2B9DqpoIsQpSh/suxd4NxntEofp50OKeolLJ/jVpt
	RrutCNpBU85sgwaVIZvS4Y6HqQ8fYGiCFkqDYrmmNTpLhqscZ79Wd/6hFdiYPFR3q9gFTFVgDGb
	kal6Yh1JPVWGIXDrLdM1rYgk4b1EQrMkHhbz0193fR72s25Q==
X-Gm-Gg: AY/fxX4K7pPPItJB3NYYD88e7Zem2DxnjQcP5Xg9SOEd1pmOijJegF0T1kgRh3GQ/DR
	Rt4vpNM56I5qV2EGC4grf8FKaL3fJK5/MIe7rTBzTPqFYHGrRPb2QXr3CXlUodD5XnC/XJ51hkO
	FZLk5Hjm1nD50YP80SYm99Sd1n9W5mSwH6Ad9nx2/IRTVPGosD++yiwyvl9rMZZl/5FyhjX+v7k
	ZijB+Pt
X-Received: by 2002:a05:6a20:94c9:b0:334:7bce:8394 with SMTP id adf61e73a8af0-3898f952fb8mr16383373637.51.1768198215340;
        Sun, 11 Jan 2026 22:10:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwdqAdE1Wj1iyx+f7toGR7vt8yGs7H/0Q3HQyuODiUq/2GNA716+wO1jenRjfjmS0zVhrxSh8z8cELx57nsTA=
X-Received: by 2002:a05:6a20:94c9:b0:334:7bce:8394 with SMTP id
 adf61e73a8af0-3898f952fb8mr16383352637.51.1768198214768; Sun, 11 Jan 2026
 22:10:14 -0800 (PST)
MIME-Version: 1.0
References: <89b5d0b8-9928-40ca-b8eb-f40080b6f3be@oss.qualcomm.com>
 <CAO9ioeUTNWu7YirxV-qnU3q9ot=Z1UYZug2Q4ArQBd+smQ+0mw@mail.gmail.com>
 <162744c4-4624-4371-84d7-3db767b40989@oss.qualcomm.com> <jkfd6edfz6lfvhz7ilma3ece2np4p6ybijgystonmoau2zrzdz@rm2odyjbopr6>
 <0fb734a0-3681-4288-b73d-afd269ac8b27@oss.qualcomm.com>
In-Reply-To: <0fb734a0-3681-4288-b73d-afd269ac8b27@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 08:10:02 +0200
X-Gm-Features: AZwV_Qg27Bft1w7H8yGoNzMfB6erY42fvIEBdGzakM27oWPi4rg87CkIaHkdQZo
Message-ID: <CAO9ioeWuyiiCF5Lr8OWnJzik4jtiO9s15rDzZRGqry3VcK=NVA@mail.gmail.com>
Subject: Re: qcom: Update ADSP firmware for qcm6490 platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: VNe6YmUPd1umKyiL3IPENSt34ifu5ESW
X-Proofpoint-ORIG-GUID: VNe6YmUPd1umKyiL3IPENSt34ifu5ESW
X-Authority-Analysis: v=2.4 cv=LeYxKzfi c=1 sm=1 tr=0 ts=69649048 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=u71rP8ScgJpdoUVoco8A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA0NiBTYWx0ZWRfXy3OLxFCOPqHC
 OXMiEn5UrU5KyBob7kp2s9jgulGW+MFK39bCxY6A4tB/S2h2/q7Q8t60TgjJvE5Q10Ep69/Zzr2
 iJiLqZYDPRTDV4ILLb0Dq7PJW7MUSwXkV2FeQBkogEDmz/7DLd3byvZhL8APr7RH/OPXXak/0TS
 La0Y/9o8u69fb/caVSs+DXIUXYfjiimvp23e3W1CXHhVaDKLLhM8kPJ+OtZlQou4hnU8PCbpR9k
 1xfWoHR5znoI5b13jH0gMm6HL21zO8UBpSTh75eS2yJeXh1vz3x0kuzziD0jUK3Xdicgx+sWz8T
 YtlhuXXzhuU1hiZ95uYhjSNCMzkU+2X8nMZUANDUy3oO6Ia9AjLl+75XXAYe7wHRn1WGib2enYp
 5tCSnJNvCH3yi8NYh2TB6bvMWYK+bE7HQ8R1F8k7xRQbn8Dl3IXP2PNJAp8AWQ39wcJeUOlRWOQ
 ziA4u4yNKNL6aLknUnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120046

On Mon, 12 Jan 2026 at 08:09, Venkata Kota
<venkata.kota@oss.qualcomm.com> wrote:
>
>
>
> On 1/12/2026 11:35 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 12, 2026 at 11:18:29AM +0530, Venkata Kota wrote:
> >>
> >>
> >> On 1/12/2026 11:14 AM, Dmitry Baryshkov wrote:
> >>> On Mon, 12 Jan 2026 at 07:42, Venkata Kota
> >>> <venkata.kota@oss.qualcomm.com> wrote:
> >>>>
> >>>> The following changes since commit fd6473795fc677b981a076e12ff10044d3e5dfa3:
> >>>>
> >>>>      Merge branch 'main' into 'main' (2026-01-10 20:55:47 +0000)
> >>>>
> >>>> are available in the Git repository at:
> >>>>
> >>>>      https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >>>> dspfw-kodiak
> >>>>
> >>>> for you to fetch changes up to 1ddcf07a2c4859c6914660a077c5649dc4dab281:
> >>>>
> >>>>      qcom: Update DSP firmware for QCM6490 platform (2026-01-12 10:42:59
> >>>> +0530)
> >>>>
> >>>> ----------------------------------------------------------------
> >>>> Venkata Kota (1):
> >>>>          qcom: Update DSP firmware for QCM6490 platform
> >>>>
> >>>>     WHENCE                |   2 +-
> >>>>     qcom/qcm6490/adsp.mbn | Bin 12693084 -> 12095036 bytes
> >>>>     2 files changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> "Update adsp, cdsp firmware for Qualcomm QCM6490 platform."
> >>>
> >>> Where is the CDSP firmware?
> >> There is only ADSP update. Corrected the message to reflect the same.>
> >
> > Please send new pull request so that it can be picked up by the robot.
> >
> > BTW: is there any changelog associated with those DSP files?
> There are few ADSP fixes. Should we capture them in the commit message
> going forward?>

Ideally yes, in some form. Let users know how critical is to update
the firmware.


-- 
With best wishes
Dmitry
