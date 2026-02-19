Return-Path: <SRS0=k++I=AX=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA64EE9A03B
	for <linux-firmware@archiver.kernel.org>; Thu, 19 Feb 2026 12:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2BBFC19423; Thu, 19 Feb 2026 12:46:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 969FAC2BC86
	for <linux-firmware@kernel.org>; Thu, 19 Feb 2026 12:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 969FAC2BC86
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JAugjw2004685
	for <linux-firmware@kernel.org>; Thu, 19 Feb 2026 12:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+L+9zK8ydvprrOJs/sfF9q5aWQWXQ3heeY2hYqMTwDE=; b=QWo/3j4UDgzWSgVA
	HHtomw1AlhjGjPr+uEeO1skZnf9YmqMG/1GPDFFk20fNQ8LqVO22Z4rXw3v9x7KR
	uz//rpEk2aH9wyXXC2Z+q8yRECp6XQ4v+R4KxSkFqNPKC6Gi87bauyxzQP1lxwOu
	tTFhQkKOGSrgCzEO+ZaTNwU6RJPVzjg5I/HkqrE6g0ZXB16asob/ouOeeTZ7TDgZ
	nRa/gMmcLbiU/USNzwAsosRqHxg1lS6Oza628to5JzHdztTuIOGMmKYrTByI6Wa7
	uVD9X02iiefTpKx+dD31uidwnSR+VK1+2i0AlzR7QP0sLxtPM9DHfhsxX2wSwvjY
	JbTQNQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdn1qhwwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 19 Feb 2026 12:45:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-504888a2a1dso63613001cf.0
        for <linux-firmware@kernel.org>; Thu, 19 Feb 2026 04:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771505143; x=1772109943; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+L+9zK8ydvprrOJs/sfF9q5aWQWXQ3heeY2hYqMTwDE=;
        b=fmdPseLkcd6e3jTjm/lo8vQjf1R2o9sP7+hYDpOV6Tn18Yfq/wXRSsDeh8eZoEtLNh
         ldmFKLMXbRc4a+t282XuuQqCQxedBCXKP2h9THfvBGMlrC6iIq+RLV0/Wm2IglucFZiW
         BNVE5NMUkGCruCIZP1AN/IQzxg72xlI8lJRvlZnoX90nXp9Tl2bxJlrtLGEGjP92dt4e
         yEMhVWy8HoPVQsnSWk9i2yUOTVcRauWL35u1J+qfEFaXhoJtrsuStgpi+XtiXFWbPuwq
         9NewTYo4fpf0s3ycmwzhyRiBCVI6CphUFZ+xd8kGzmSG8b1Yw4KiKdHyTJT0BhSR9s1A
         MH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771505143; x=1772109943;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+L+9zK8ydvprrOJs/sfF9q5aWQWXQ3heeY2hYqMTwDE=;
        b=jFLO9IfDWMHmVjnN/zs3UZwKMbi2uvAWJR+/MtfJj+JW06rBjlQxPBlDpVuLvYzM/u
         +VWvNt4M2mD/lxbEPKRQF4UrX9EvBcmIE8bhVKeKvQWv7E/8xKuRNANbOj3RJoI94XCj
         XuEh93qGMdBlJatOLSGRVj+Ye2bRB0LoaDGx9W1wwkYY6nmz+gYB3ogVg4IeNXALZluB
         yIhF1HupWW9GS++zPvKbVySXMzUdOyJaGWGyncZuWleGZbI+XczJkV//LyTUBamZZ5Rv
         Pg+ZxjWKUpd3SRyvenSQqJj0e/JoKEYl9G+4YLK4YQY3JfbkP8hnh60XOPxE70JC6Mle
         87+Q==
X-Gm-Message-State: AOJu0YyuPtBVOfBGa57IKAO0Vn/J9Jm+E8I+gk0vE6nS4p39hPEKcOIe
	yuEmlG15kU64r+5Vh0hArNCNWMjcFF4nYF7zsIX2u0NMKRb/Yc5mDAR8l+hXL0Seg/6XquRb7P+
	lykEO8ToWk/TFcr42Vcdgw3M99I3BgeJ9PjibMkb6+f6NCYbP6jXqyPp9PE6atkc=
X-Gm-Gg: AZuq6aJKJePaoo24BEglggZ1D8aE+CXFICn0kuu3/EFzqMk8adkRJpGAAR8yIb6q7zo
	6uaxPO9+7XZB1NTqAdvqX8hwMQGFuHyEc38ltRPoVIFCI9/N/20kCcblSEDgeG89+5UdcQ6YtQo
	sOVylMMlBMPyL2iZmbOAtjy2JASRuLhX+vzDgWqRct5huTpH5RZQfaWwqyqrCRYhWbv9kwktLRh
	LJHrlxWP/a/aiR13zX1/vaMOJLG+o8/4I3VOgBi3A+5/q2aTius3TYdaFPvim93DGbR57Is+C6R
	FD+LG0Mf0+YwxMy1TaKw8YkK339X4P/32ZCFUlqyUNY5VEzrIHTz49AWnFjhp+fEDzFApROU8yt
	WEgu1cBhom0tAJP4G9UMN8E8lXb50AVTQabrWWvFjvEjdx0LTyS6wjMKpPzKbEYxQTxnh8/D92J
	BLRt1EYZv2Oo5xP4jadnVpO506JjcujO7E/hs=
X-Received: by 2002:a05:620a:40ca:b0:8cb:4c23:3de2 with SMTP id af79cd13be357-8cb740c4099mr629414085a.76.1771505143453;
        Thu, 19 Feb 2026 04:45:43 -0800 (PST)
X-Received: by 2002:a05:620a:40ca:b0:8cb:4c23:3de2 with SMTP id af79cd13be357-8cb740c4099mr629410285a.76.1771505142904;
        Thu, 19 Feb 2026 04:45:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f563138sm5158137e87.15.2026.02.19.04.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 04:45:42 -0800 (PST)
Date: Thu, 19 Feb 2026 14:45:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: Re: qcom: vpu: Add video firmware Gen2 binary for SC7280
Message-ID: <ksf5fwfvot5jwrxq5l3kqq7wukj2brdadldq6vbomqw4x4rydi@rqi3a3ija36q>
References: <fbc5562b-6b15-141f-0039-6c1a5931d555@oss.qualcomm.com>
 <4gw7ghocmugk7w7urjat2kfsragtqvtq2obnxaq7buibnktbho@o2jkqxbfutpu>
 <b3bcdf45-bf16-b334-964c-daf338f5816f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3bcdf45-bf16-b334-964c-daf338f5816f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: jltJAnvLvDVGNtMHYUjPRG_t1RGuvFPZ
X-Proofpoint-GUID: jltJAnvLvDVGNtMHYUjPRG_t1RGuvFPZ
X-Authority-Analysis: v=2.4 cv=c7umgB9l c=1 sm=1 tr=0 ts=699705f8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=qC_FGOx9AAAA:8
 a=W0aLRtTeAf3Dn9fgWlkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDExNSBTYWx0ZWRfX3xNlVJyg8siJ
 VJpg2WEh0vStAvvYbbutibKJ5eisUpTm6lrSu3h4NTVjnbVKr7UKkgbdOxzt/dORL7SgldQU5Qm
 F9NJroUpm5meBRdmusu2ZJJrJoYxOfahs8nDHpFdfLTZ36MHDGtepAvRYIae+h59A0pWTgU7pt3
 A/aadeXcZAkgjrC62x72mYPRHnkJKQcz0vpgfTyRDOIxRsmnfqIs1+F0iSmELJB5HGKs8HgvKma
 YmziVDwiKoMkEzYTY4bHPZ2gGF3ycvfDjbH7Se9mpacQupZ9EYC2DROW1V86IwJ8CetJXcqlSWK
 ATxK8UPFPivB1RejGLrnXNfpZ9dxycsR+0eEOsNTvAoE52YnZgW/+ztX6DmbG84v2Kl+wZG4L+o
 IF0lKLtEkUimhIG2A5hnAbVw91BQdxHFwAhiq3wpJdTEtf+sDpmQdcPxcLqIEZapmL3mLFiyftJ
 Ni6kqEThPltsycMqWsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190115



On 19/02/2026 14:32, Dikshita Agarwal wrote:
> On 2/19/2026 11:46 AM, Dmitry Baryshkov wrote:
>> On Thu, Feb 19, 2026 at 11:09:29AM +0530, Dikshita Agarwal wrote:
>>> Hi,
>>>
>>> The following changes since commit f2dbd7a7a74be0d309d8058a55308dcea33a41d6:
>>>
>>>    Merge branch 'robot/pr-0-1770355730' into 'main' (2026-02-06 07:17:03 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>> video-fw-kodiak-gen2
>>>
>>> for you to fetch changes up to 3da84f1b4bb062f18d7f08807beeb46328e06d46:
>>>
>>>    qcom vpu: Add video firmware Gen2 binary for SC7280 (2026-02-19 11:01:56
>>> +0530)
>>>
>>> ----------------------------------------------------------------
>>> Dikshita Agarwal (1):
>>>        qcom vpu: Add video firmware Gen2 binary for SC7280
>>>
>>>   WHENCE                        |   4 ++++
>>>   qcom/vpu/vpu20_p1_s6_gen2.mbn | Bin 0 -> 2030620 bytes
>>
>> What is the difference from the existing qcom/vpu/vpu20_p1_gen2.mbn?
>> Why did you use a different name for the binary? Why are we not
>> providing the backwards compatibility with the previous name?
> 
> As I mentioned in the other thread, the earlier binary I posted was
> incorrect. It contained an MBN v7 header,

Well... You didn't clarify why it was not working. Nor why did it get submitted this way.

> which is not compatible with the
> SC7280. The correct binary should use an MBN v6 header.
> 
> This one uses the MBN v6 header, which is why it is named
> vpu20_p1_s6_gen2.mbn following the same naming convention as other video
> firmwares.

I'd rather suggest vpu20_p1_gen2_s6.mbn. Consider other firmware for the
the same VPU core with different signatures, vpu20_p1_s7_gen2.mbn vs
vpu20_p1_gen2_s7.mbn. The latter points out that it is the same
firmware, just signed differently.

> I was initially planning to drop the non‑working firmware vpu20_p1_gen2.mbn
> in this PR, but since you already raised a PR for it, I didn’t make any
> changes regarding that file.

What is the firmware name that the driver has been using? I can clearly
see .fwname = "./qcom/vpu/vpu20_p1_gen2.mbn" in the current source code,
which means that we likely out to provide the old name. I'd say, you
either need to pick up my patch in your branch or just remove the
existing firmware file on your own. And possibly provide a compatibility
Link: clause. In any case, it all requires a better commit message than
just "Add Host Firmware Interface (HFI) Gen2 based video firmware binary
for sc7280.".

> 
>>
>> Granted your comment on the previous binary, was it actually tested?
> 
> Yes, it is tested.

-- 
With best wishes
Dmitry
