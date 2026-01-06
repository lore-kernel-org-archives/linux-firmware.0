Return-Path: <SRS0=NJ94=7L=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769E8CE9D64
	for <linux-firmware@archiver.kernel.org>; Tue,  6 Jan 2026 15:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47343C19423; Tue,  6 Jan 2026 15:38:05 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 618E1C16AAE
	for <linux-firmware@kernel.org>; Tue,  6 Jan 2026 15:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 618E1C16AAE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606B03g32684074
	for <linux-firmware@kernel.org>; Tue, 6 Jan 2026 15:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3koakS4qBJ7b2o3YF+3tjm7r
	yZx8nn0lhwSepbmkTc0=; b=SJq7pu9L04K2AyTrRI10AeetYjH8i+TxthFcvuQ9
	OHoHSM7hPeBfysL639NyuLR+xnPJImlAAEJ/SYLHsOUdu7b+PEpWWUug2FD2gJUh
	tTS8r2vjxJg7W4FZSBRpqC22UoW4S+iZcCr3tttf344iBndv1UJWDAW0JgW5rV9+
	2qrhjEexV7gMHf3Ej+JSuBcyuWYKbEICrJF93bGLVEdc8TtA0zNXI3v+4fJPlZJj
	3oStC1kC90+GHRM2+/Z9IuvdXEIRySlEAmUU9WMHJA+is7q7LpMqk0sDCBlF/fy9
	4X6hRNBwzX+ogOTOWCwJq1zpWZnoRqVGzOzcmEizyJObsg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgty5hwkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 06 Jan 2026 15:38:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6ceab125so30749641cf.1
        for <linux-firmware@kernel.org>; Tue, 06 Jan 2026 07:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767713882; x=1768318682; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3koakS4qBJ7b2o3YF+3tjm7ryZx8nn0lhwSepbmkTc0=;
        b=LUPHSqtnFD3Z+6l3X9rv0alF+EX6+y+Vg1q3Ms3B/ynS8eRTIYOWxE2/95Vw0oWSy4
         9o828Gg5vhpvjewtV22XLpCoMSCpkSnYWC4h0farrF94kxgJLg11vJcn3f22ep0iiYoO
         +mI27heDJqAZgZhFMUSMzjGUC3OeHcCsb8t5qgSzsxDVoIWPt1+NPmlGzlBEn3uX82a/
         qvxigCYlkoe/VGj2OkUWJjYqA6u/puRykgsei+nzRF6gp5W4GFZL34ljZZAWxYtKa2KA
         6QyJtdJS5+sFy7FVS9kgzBeJoazDHxPCmt9sofCXo9FTULb6jD7SX3PSOtLbcP6O9rQs
         QRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767713882; x=1768318682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3koakS4qBJ7b2o3YF+3tjm7ryZx8nn0lhwSepbmkTc0=;
        b=VUqaxS+OGSLZ3rO3CI2+kodXGuP2z+jvMsDWognSj8x7swsqZZHnPlKTjkm54lOxmN
         uQ6HNdeAaEzs+C7tqiym7HJGRBoVE4YHV8vTET8YgUmwh5o9Y5XBhxGIFp2LPv7MwNrG
         bFFqfDk0U7g3U/gUJOT2iLC8A5I4QUeFuNv+S/t+ayYOjK0cbtKH/tM9Sgmdd/SlWHtK
         lM0y0WycZvjypXgL/fMUYP0fvs/h8TR+2SerkE6+oTHKPYADu4vAE/EMrM5SDxK97Xlt
         RaYzI4Xf7UDT8iMmUcUIUM4Mu22tV1kNrrzd+KpFQqqGqv0YGZVIZECSsxF3yMxn39iL
         MPCQ==
X-Gm-Message-State: AOJu0YyQTPujHG5Roe/urAzvBr92YpdmaxwIju8XsLx6v/Z+btgY2FD5
	gVyH+JVbMgSxMe2hXNbN4arOjCdsXVfHn1Epgf1HN6UDF+2BY7+vckd3Ujwnq9Mv2wV5fJeBoXb
	1J/zCRwL0QwHOh9ywlSgGB2gO2RQ08fCMDlGYuS5fnMoo8gT0Nr39QY9vNOJl0CA=
X-Gm-Gg: AY/fxX7PPLBEMCDpHJn+G+sTJ8v36c6iewTJeGOFICm463ARYMlBaojHGSf3ufpG2Un
	D0eTVvmdQcAVn1FCbUsTktvU9RPoI4CqWGmausU2YoZhc9Ec4FiGMjUrPPxx2Y5aFJRPw3jn+qL
	gLZsdOkpmF8hQ6D+PPVrI9KJguKHnPt8l05Oz6BjcMw09kFcqYK+D38OVKxIaekVZm8nWfvPNoY
	OAj9JQNUm53NO7QykvyOHwiDez6vEjNvdZDRkOhMJ9rFwlW8RNFn8HNJf5RBXZkSQUUOA2Yx3j3
	xtPiNAQjXZTnrkPONa8AZzxNnj4ByeNrTt/oEuwmuioosjL6A/sN5z+QzbQc6j8O78JKMaV5v/R
	iL7chffqgxol+E6ENGxbVNo8+hnRH1j4bNFppW4gqjDKF2ExQAf5i+1si9zLiQRUQ7bOgLA4SlU
	/+WajmQg9fiO2CmbRsEkQPVq8=
X-Received: by 2002:a05:622a:2507:b0:4f1:ddda:9a26 with SMTP id d75a77b69052e-4ffa76f5d64mr41498151cf.35.1767713882099;
        Tue, 06 Jan 2026 07:38:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBN712753O3LMHlwWt/lqaeoE6ZoWf8dWfGuPT2Sl7cpyUrX1YNm7iFBA7TdWT70HANHfd8A==
X-Received: by 2002:a05:622a:2507:b0:4f1:ddda:9a26 with SMTP id d75a77b69052e-4ffa76f5d64mr41497851cf.35.1767713881683;
        Tue, 06 Jan 2026 07:38:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0d95dsm662453e87.30.2026.01.06.07.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:38:01 -0800 (PST)
Date: Tue, 6 Jan 2026 17:37:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Janaki Ramaiah Thota <janaki.thota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, hbandi@qti.qualcomm.com,
        mohamull@qti.qualcomm.com
Subject: Re: [GIT PULL] qca: Update Bluetooth WCN6750 1.1.3-00100 firmware to
 1.1.3-00105
Message-ID: <dbbadak6quc2nsntv77jd2zildynw2szw4jqg5wb22f5eeyalk@3s5s6icuz3lz>
References: <CAPiVHHi9ysios_oubHtY0aWzFubc6L4X11JM5hyAyFsk6QniqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPiVHHi9ysios_oubHtY0aWzFubc6L4X11JM5hyAyFsk6QniqA@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEzNiBTYWx0ZWRfX2hQvD0pYV7Qq
 Cr65xcAsMjoDhbg/oqxVcE/JjijVEW+H4H8Ixzbzblc3/RZmww//5B8dQ/ND/+s3jByqvbCKlkB
 OpmrdtvFE3y8RUoZbG2kWk7ps6vOhUDDo5+v+kurED5tJnZfrZxaR/SvnBMSpORY6hUeOtIziVj
 1lOskVXIzH4KEncdQMgGvAl0XYUPttPvOQ/ubsVIrW7BK9Dgef1iG1RpvRtgOeTJUu1EBbChfSj
 nNXS77fDLs0202uvtPKLfrocDo2U0haTRTIXvALF/cyeKD7E8XIdRHX5C2Csiz6HSlLIpDr6n3o
 Hnk/22PdlD2ZmPS1EBiZO2ATLuquIpBUR+PHA6QYXCimFkX9NTOtRdAxZY6KA1fFBBFx06GJ8VN
 kohQw94JYx+bfVtvTayXnDMYw+6dZOF2EuUODcQs41AyFfvOg3Umxp2BSYvOpqDcdyldO5aqFv5
 7T/+SNSkiwMHRBYAo/A==
X-Authority-Analysis: v=2.4 cv=Rfidyltv c=1 sm=1 tr=0 ts=695d2c5a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=OrPP9w_7K2Ppw8eQmToA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 2ku-GFVj_-QCKbzrGhLbRUk7ZL7gwD34
X-Proofpoint-ORIG-GUID: 2ku-GFVj_-QCKbzrGhLbRUk7ZL7gwD34
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060136

On Tue, Jan 06, 2026 at 06:13:03PM +0530, Janaki Ramaiah Thota wrote:
> Hi linux-firmware maintainers,
> 
>  Here's a pull request for bluetooth firmware. Please let me know if
>  you have any problems.
> 
> The following changes since commit 7e7fd7c891902d6fb8b0c93e27afaf4e023b6025:
> 
>   Merge branch 'revert-qdu100-kernel' into 'main' (2026-01-05 23:38:11 +0000)
> 
>   are available in the Git repository at:
> 
>   https://github.com/quicjathot/bt_msl_fw_1.1.3_00105.git
> 
>   for you to fetch changes up to b85e1561bdfc1efb02b4377161c850b075d6d4d4:
> 
>   qca: Update Bluetooth WCN6750 1.1.3-00100 firmware to 1.1.3-00105
> (2026-01-06 17:18:48 +0530)
> 
> ----------------------------------------------------------------
> Janaki Ramaiah Thota (1):
>       qca: Update Bluetooth WCN6750 1.1.3-00100 firmware to 1.1.3-00105

Merged and pushed out

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/844

-- 
With best wishes
Dmitry
