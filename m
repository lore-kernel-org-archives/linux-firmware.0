Return-Path: <SRS0=Bcig=53=oss.qualcomm.com=renjiang.han@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AD5CF258C
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Nov 2025 09:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 588E9C116B1; Wed, 19 Nov 2025 09:40:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 10367C4CEF5
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 09:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 10367C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ4XhPn885042
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 09:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C3hPgk3u7ibkPl9VcDvWVw
	f5AKem48ipX5uDpqlMy9E=; b=iSHtDOfF1+6ZagmzQcDBiQHipbVefrvMoteq31
	rIRNI1WnnPVfagexp75sF7TRKKhyut4Wd2zZiW2bNdm3aZK7KJn6wrejQPvA2PTn
	GolpT6P4e+AclE+Cqk9U4O5dZCQmnsLQGJuYrgG9WoT0KB2s85XCM2bdiiCksgRj
	T1xINSy4K1I+aNaOBY0MjtjQFt4vLf4d7daXCq27E6DPKraXgkpjEFnXZoXPnzW9
	dZqxKG+hib0mSj12Nzdd/VbNelQJ4xYYBYdRWB+GPlu4EuGYod7NzmIPPkeF3iYT
	g/2oWoaybanekmYZqvlNS8TB4i+eGnsEUVrvBpZF1FU1T7Qg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah6yq8vd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 09:39:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7be94e1a073so7052086b3a.2
        for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 01:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763545194; x=1764149994; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3hPgk3u7ibkPl9VcDvWVwf5AKem48ipX5uDpqlMy9E=;
        b=kSD5C794yUwPbNXzgveNG+CIHgoV73TVQRedzEjzGUVtNSPy+JZXOY+p9rs7mvasH7
         FMwegM3/VJaIWlCrHy5/kSszLM91chEy9zFMOe7J2BdmgZkidsGWlIghJGicF2xZQzEz
         NMvbhPAjx45hlTdWw4SkGSjZqnBgVn7eAZvgVqzN/KBWbei3Vau7aN5Ac5zUisPx9gT4
         QCcUoD1hLZTQEAOew3uBI58JIO8hS8Y4fONXSFoD3uGdxDGam8rKmhTE4Dm4zG6mhKiw
         hbG68SiqGi1oIaoRZLTfYOggYWaf3h2yVTiTQ62y+Jv8JLSQJa6YWi/jqcHZYPzhY6o/
         Br8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763545194; x=1764149994;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C3hPgk3u7ibkPl9VcDvWVwf5AKem48ipX5uDpqlMy9E=;
        b=ZVXcGlLxC6MeDra6A3X6KtYFpk2+2qLbQ/UjgzQ9/D6SotZUReeknQF6uNH7FDyC89
         fo+JafzrAXCd0DZ7CCCXa64q9S/Ant5VItwLOMmY44F/ouFbhUgrCpSDWCQCxjPyeWXD
         3TvNRZE2fAgYNYVvgArk54y/ZXAnk4q2G0GW1x+VF5DjeAsAtnWIKONb78KREM1xzjf7
         O+HfsLjXYhYTuy0flEj4LuwjsoQxkKtPrukYLLDYmQPcQeultAqGcNxi/+DIpkxBwMQ1
         tknhziJDLZzi7wbIyh6Acr7RSaVM/YoOa2N+EVjc86+cVEDdjQWWO8vgGIdbT5oFDiEA
         jV0A==
X-Gm-Message-State: AOJu0YynP5MpVeIjpHhaoxb9SawkmK7Hv+iMOhTszgf/k4goGeGVDRRz
	ClZDD33I08hsVRt/m4lV826vGrCY0BYL2EWgcikHXGEWy6aI7mfJbp+7/St/XEUjNxaQWdy2I/s
	vtmeqHQssMoFH3xaIuKuZupn6RFyMoANKQ6/aI4DJBFuihWkOrErAOCKgnurzOHsCmN8yrgc=
X-Gm-Gg: ASbGncukXeQZ0YxvyplkDiXaoXCJSY8oWHAQoRzCa17SZMqwp/x2Qf7X0jxtZM9EhME
	5KlBuTO31B8AQxDapa0zORbJ6sjjBJ2/rG+QIDACkPJK1haphWPqyS4Qly51xklXocQoaihcZhp
	6TC1L/Cy0yb/ymw9TpTYavA4tlaXDQ3KBxETYp7lZe6+gFN5gkPtu+lM85qGetT92peBMfbN5tf
	abafGuZVXPsLwgSsc7qpu8md2dZJ8RK8YDXkd8GBbfGWc+YfqHEnRFf8/anwvoVEYpRDvQnrS0r
	PqmndLx7ImqfnNPZ9ptUvTBr9/jzn8kg3oTxPCQ58L0+kwtiutSggWEOK307QWAt+9LSW6AArED
	Q/IIeUVBobTxadNrhwbFKmgmNOO+jaJRK0kWhqcqp3yWjs9S2m6RGe16n14UuXb/SHZEy3cahFE
	i7H09qPw==
X-Received: by 2002:a05:6a00:2302:b0:7ac:edc4:fb82 with SMTP id d2e1a72fcca58-7ba39b3f273mr21915611b3a.5.1763545193597;
        Wed, 19 Nov 2025 01:39:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyPMF6qIxSLCFGPgFQJRNJ56FKmechAox5q2Yu1t/eRGkhKmM6lO5P8W1rvuxEqmmQzCVWwg==
X-Received: by 2002:a05:6a00:2302:b0:7ac:edc4:fb82 with SMTP id d2e1a72fcca58-7ba39b3f273mr21915583b3a.5.1763545193032;
        Wed, 19 Nov 2025 01:39:53 -0800 (PST)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9271506b1sm19122762b3a.45.2025.11.19.01.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 01:39:49 -0800 (PST)
Message-ID: <d3442fba-a616-4260-a2c1-bf14d0d64250@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 17:39:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
Subject: update firmware binary for v5.4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: p0UfAKgBe7DUpkDWFNWpTT9pgAw43gjF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA3NSBTYWx0ZWRfX1IGBckRefFTP
 rPRrkjDZbqFRCcADWv2rYGzmBcTPG6zWTjDyH84mo6XPtbv1jNOO86CGQM/GgVAv45R/d1z5z/K
 wIJNCucPoRSEL2d8j1CqMGwBNhpZ0t9rqhrTw5FJfmIW3v3hoI7fUbi1PzYKDuAdK6on0/8QTBF
 jTO+XukwajCSU+kx57DqtzvwfiaYwA+Zb7p34zGmpOlDXO69PgrfJkY1NY5Le5LNEXhf5vb2zda
 SiQncipG2rxaDwnUYW6wPHBflV4s2vgTW2NE6jKhrpAb5HAkwLtDzeuEOlrpoCM2jk9wiPgOPql
 g6w5QMKFOSRJwY/Wqt1HViP/DF0J5NtAXqAPRXNnfFr+Z10df5HWmj15waKs+a8PoHCeVus+fHG
 XX6BNxXRRs+gsO7ajqyW58gtsYAv0A==
X-Authority-Analysis: v=2.4 cv=Ut1u9uwB c=1 sm=1 tr=0 ts=691d906a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=gV6IESIN3Jjer9TTzF8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: p0UfAKgBe7DUpkDWFNWpTT9pgAw43gjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190075

Hi

The following changes since commit 6fc940781a013ad837ed8fea326d2b897467bbc3:

   Merge branch 'robot/patch-0-1762826844' into 'main' (2025-11-11 
12:02:02 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
update-video-fw-sm6150

for you to fetch changes up to 0a6f987b7b07a6fec2d4fd42ac4473c0523d3af6:

   qcom: venus-5.4: update firmware binary for v5.4 (2025-11-19 15:04:09 
+0530)

----------------------------------------------------------------
Renjiang Han (1):
       qcom: venus-5.4: update firmware binary for v5.4

  WHENCE                      |   6 +-----
  qcom/venus-5.4/venus.mbn    | Bin 922216 -> 922312 bytes
  qcom/venus-5.4/venus_s2.mbn | Bin 919008 -> 0 bytes
  3 files changed, 1 insertion(+), 5 deletions(-)
  delete mode 100644 qcom/venus-5.4/venus_s2.mbn


Best Regards,

Renjiang


