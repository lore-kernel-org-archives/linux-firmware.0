Return-Path: <SRS0=MQre=Y7=oss.qualcomm.com=akhilpo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D9CC71136
	for <linux-firmware@archiver.kernel.org>; Mon, 16 Jun 2025 05:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 74008C4CEED; Mon, 16 Jun 2025 05:04:14 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 21E89C4CEEA
	for <linux-firmware@kernel.org>; Mon, 16 Jun 2025 05:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 21E89C4CEEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FNTYQc011037
	for <linux-firmware@kernel.org>; Mon, 16 Jun 2025 05:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s/aS1NkG0Gi2qyILF4tZ0/
	HaNWbJWuMDPyrfMkSJJYk=; b=Ha+3U4IqPqOwkaRIs5v2VG8JPu5XR0eDqFlZIc
	Ab/dJAvuyybATsEY8jYcTp04WNRP20xvKkCgQb64EoRMuqmVc7rZnXqfqV9WsCLU
	yG1+PreTPckIRSFTue6dS9mUkoaK1xnx1EnJgLC8I9xOsgJWAtqYOeSZHFQUNlDq
	Ucw9Rn0D2kI6bPX/j9g2fMM4sgxImG9fNL+YA19BECk6f4KaJKwv3iOcWoBewAgs
	ynbhT5+vpcvkVVqwbapXXGFqaiUUaO7oE7RCBW6lgTD0vZZZ+OjBc3fZT7s8FKYZ
	DPokg8Bc7GPDpLDEZ4QBWsPqUI9pkp20gooBeK9xLMgSTgvw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f733tx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 16 Jun 2025 05:04:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311ef4fb5fdso3502570a91.1
        for <linux-firmware@kernel.org>; Sun, 15 Jun 2025 22:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750050250; x=1750655050;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s/aS1NkG0Gi2qyILF4tZ0/HaNWbJWuMDPyrfMkSJJYk=;
        b=T8oC9aiB5qXhE3oeFZy7bHSBqcAnpl1vh0x9heJxMAgGhHX7cXTB1qZ8nSSpx+jaC1
         X8WijK5ajmg2dVj72TVzCzXGdAXETme7HInOzwmA5ramALQ4sl5wKvKOSPbI3Plu8Q8+
         4ZhZRMtGIGZb9cw1Lc8qfNf0tJVHPu9iJ1JS2gG0/lh3R2t5wkzURxJXGECkkFrKyViZ
         gWAep6RidOBBYYvejhmTRnypEukr87KJAVGIUZKjgedTm8BPGBefxZtFXAefWcjGBnWQ
         09yoewXSJY6yCSfSGBueHtHsv/rGAfKJ6093iZfqSphbv9ZxdF1LcEkZygbRJl9fgrLe
         Ok7Q==
X-Gm-Message-State: AOJu0Yz3cJbZX7Z48+7WEHmkispWdtJB+phrr+mbOYKmkE76HXYF5+hi
	45Z1Flo6CSw8aWnKEiqxhCd6zdMVsrc10Bb9PrP2AYrbnBgwL2OyLcAsCaAfCF6MTJY748VhkN2
	GWNoXcbvlJea45TmGZWFBCMy/8CtheG+TzcYodkGvtlLgreD6XX8nxWha3affAg+NVV1zfAw=
X-Gm-Gg: ASbGncvLzyPbnRBaalmiVhnRttbrrqI3lAX/ViGRUQ48Dn5Q3+0GqDjHJkXRmx5/jqd
	Rk0FAN3OQvwDbgnPZCFU4JVcg0rns+xRX9aPbNZk5upjmSbgvcV6XbaLwudRzzdADkYgX6vy+Vq
	kpBm77R4rTZ6ze1fhvDRoNSnpBAsjxnNbruOwe1uXlsa6+Z/kpksuiv11k9VDuWzDp5nhNR0/WK
	8ok9I9x9MdkqIXbLMzSJo+iWhVseNcd10U5VFxQwTnS4zR6Jcz9MW8jsOC9Hg8GrTG/ZjZAfEMC
	wD6YLNJEK/NzkjN7VIIgok+L6xJ4iIaeVVX8o6gxSw==
X-Received: by 2002:a17:90a:c110:b0:311:e2ce:66ea with SMTP id 98e67ed59e1d1-313f18d816fmr14145340a91.0.1750050250234;
        Sun, 15 Jun 2025 22:04:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv97J0dIDNa2L0+WWS9qWYfMAVRCdgQOdkc6Z8U7Y5v3w+owjDQI3caVJpgl8ycnacb6gtHA==
X-Received: by 2002:a17:90a:c110:b0:311:e2ce:66ea with SMTP id 98e67ed59e1d1-313f18d816fmr14145301a91.0.1750050249783;
        Sun, 15 Jun 2025 22:04:09 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.231.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1c6a729sm7537810a91.43.2025.06.15.22.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jun 2025 22:04:09 -0700 (PDT)
Message-ID: <e036373e-0356-4fa1-b39b-78eaf02179d6@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 10:34:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Subject: [GIT PULL] qcom: GPU firmwares for X1P42100 chipset
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAzMSBTYWx0ZWRfX45pi1q9kNzyI
 1kUw5YVtjEVB/qlHUzFurrot1l+aShfktuk8+KJO/ei3E+z78DBk95RPYfPDTt2ZVye5kdsralE
 vtZm6z7aCAS/4nXTub7ayBCHiAF+bHmvqG2c5VTBQ8yEYKMTVPvgd0wUzrphD2PTUtVYVpSMzHd
 W05w4+SMA2bQFFCcSDz0VF92xi6IYONI6B/vPzj/+AAhJyBji2GIi6QAqWdWwKg/xvX1DMbO94v
 DfzNlqtC1ZglkQbH3Wgg8R2LTAf7/bWUOTFGUwjgDf9FUCkTjE7RyOhzKqGEgsjOO5UXNicDo9n
 23hKAycS5AhhzXVGY5LG586eaq+8M0Ipvqf73O/4sgLPniSHbko1J5he8be18rfzM8FRgT74Sz8
 v8jWP2Mu4gm9hDN5Z6DXdK9DDm7PhjnaQGDjcKgHNRbR8OjUNW5CK3NA2vXdJX9UvfzbYSf6
X-Proofpoint-GUID: CZn3W_xGgRQgWs7lM9gQKOpyQpbmAFI1
X-Proofpoint-ORIG-GUID: CZn3W_xGgRQgWs7lM9gQKOpyQpbmAFI1
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=684fa5cb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=UH61rShEP5ZXOK8RUAspcw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8 a=RJ7wQf3KvXM9N819bAUA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=554 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160031

Hi,

Please pull the gpu firmwares required for Qualcomm's X1P42100 series chipset.

-Akhil

---
The following changes since commit 12fe085fa4096dedd82a9af0901fb8721379011f:

  Merge branch 'qca-btfw' into 'main' (2025-06-13 12:32:39 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-x1p

for you to fetch changes up to 4cb2b59c30c23fdda8c4b00f00397fb7b4992758:

  qcom: add gpu firmwares for X1P42100 chipset (2025-06-16 10:14:53 +0530)

----------------------------------------------------------------
Akhil P Oommen (1):
      qcom: add gpu firmwares for X1P42100 chipset

 WHENCE                         |   3 +++
 qcom/gen71500_gmu.bin          | Bin 0 -> 80268 bytes
 qcom/gen71500_sqe.fw           | Bin 0 -> 67348 bytes
 qcom/x1p42100/gen71500_zap.mbn | Bin 0 -> 12088 bytes
 4 files changed, 3 insertions(+)
 create mode 100644 qcom/gen71500_gmu.bin
 create mode 100644 qcom/gen71500_sqe.fw
 create mode 100644 qcom/x1p42100/gen71500_zap.mbn
