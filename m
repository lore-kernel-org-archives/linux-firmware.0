Return-Path: <SRS0=olu5=7L=oss.qualcomm.com=jeff.hugo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C188CEFCEC
	for <linux-firmware@archiver.kernel.org>; Tue,  6 Jan 2026 18:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33593C19422; Tue,  6 Jan 2026 18:39:56 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32331C116C6
	for <linux-firmware@kernel.org>; Tue,  6 Jan 2026 18:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 32331C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606I1kSV4091247
	for <linux-firmware@kernel.org>; Tue, 6 Jan 2026 18:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v3sc0Kk9a/EAyKJYmSpH3P
	jB2CQvRJNuX4XC9bOeKJQ=; b=d4yvX6rbLQKWhLvwcua0c++0/001fJQJZU1ox9
	QJlfmek6NG5CcmGO6L+FNjluFL7ACAzB5y3SY93C4Sbqomx2229A0p+pPwtaf/sT
	811LYiJHIpV8cVtcr85oqgKWlBAWNtV36lFBmHnvzHC0e6JEuN12QpCQFM+WldHk
	HmoXicV+fdM2IjVlIYtS89OtEYgeGQFvxGLmWtgZOIBg+lP3pshJg0Axd2nT3nPR
	1fGySrN4rBu+nz3+kDr2Lwc6iP+p4oOH7HmqFHVgDuR0docayYDMsWcCiOTjBvjW
	PDCgJZsq2Ldjnvzr7G2r+lc+cbLwS1/jWEvy+cEHWrEeemWA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgyun9k29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 06 Jan 2026 18:39:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b0751d8de7so635222eec.1
        for <linux-firmware@kernel.org>; Tue, 06 Jan 2026 10:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767724793; x=1768329593; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3sc0Kk9a/EAyKJYmSpH3PjB2CQvRJNuX4XC9bOeKJQ=;
        b=MYDDJtak0E68Ne4idkINj24ptDiqLYR7e4jJtd/LB1wzmvtwEPkeRuipscQOuy272V
         dLWE3QEK3SyvTidlF9NFz7eZUOK9jx7aM2WEFtpAUq5ArTat8fWm2fjQjWK2veyfzXy5
         K3ANeo80KFmyIT39rwIYwoPVxMP64uNS7U2A/kOCDomHfMEogUOk4Nns3IsgbudebosC
         i60vpAFVMdjso7iiQjPNpWBI3Gapsoux1DnGeuXAs5SCLyySxwGoCNSiKyrvKaPbUR2C
         D6+1xhUJ33Nszh54eFxGJjRKjh1cosRUheMViD483nvWr5GVZbOW000nCTh/SUqBOki+
         hIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767724793; x=1768329593;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v3sc0Kk9a/EAyKJYmSpH3PjB2CQvRJNuX4XC9bOeKJQ=;
        b=gq5PF1R5ijAxBKXDwrkdAgLVs+ZD2dEY2cCzvxPNzaS62jWCrq3j4vQtx7yL4G5kgm
         +qsiMqSBJbDr3nW8/uIq4XoVLCbPA9a1qUUGf2BuvydBGAb1awSYeMkJMMvzNiqcwaBX
         EKuDrWmlN56jqDPyZsADc2FxGDZvPY4NmzVmgw8Myer1HG5WiKmIn4/+h2o546tI4WgE
         zc8DyoR8vherT9Jj2IVbSq77zkSHsUNcMKHb5pjx/kTFv0ExrosXMLLMXTfVZyx++WtS
         zHSFm9ijLL9iDbHIPd0DftRVr752TpEaL9YeCS9N0qEF57TcyvOupL6VAMHKfSKarEn3
         52Yg==
X-Gm-Message-State: AOJu0Yw42Wupz/OcxyqI6gjRu50pQYleJn7Eb/DVjswaKxz1P7w05NXp
	RtpJ5Tk9SFrCBycPHrpZ0sqQCfHQU4rYplmd83Mjy56R2KM8p/caj+HuWn4fBBmYI0M/0UdLE6j
	VHMufOhLc/hKBsPqwxEkDiYRHhs/8PIh/6Jkw6MCNRmTIu3/uz1IUdh0dusN3mWtkBJTEfn0=
X-Gm-Gg: AY/fxX7GchMxFv3gryFfAM2bLzm2+rZtQvncwUygnVkRvECB1U4HMOWk1rSDNRXF2Yd
	JnUl5B2YuduLEia6k6H3WQCwozcEd5YrkUCW5IXKQ7bZJ0HC32eul6Px7evQ9j03JsTof91+7Nr
	bYD+v7Z1DKPite9c13gSkxLgHedakzialJ3YXeZ0AIV5Lmq/x81s2/f7BVPWOEMe+wS+9RhXgHO
	WyQ4hrJgZmBBM0qYP/+9RG0/6aRcmFDLUlnFCH4SVDzWR8OlRdKgI5tgIJzqOidEE029vmTbua8
	JHkIj0eq1/8nB2vbOJJCzaXZx7yXVI+EpNDj9SRpxgSWnh4VH96356M4Ig3XOT92KEPTjKn6cBA
	MRuoQrgypwK0I3Ngvj7Yt3BD8o9rKEGWvKuIKbW9ko8OQ6jnYAAZ0AEe4uecdeo4=
X-Received: by 2002:a05:7300:2d15:b0:2ae:50d5:bc0f with SMTP id 5a478bee46e88-2b16f91b85fmr2920007eec.26.1767724792784;
        Tue, 06 Jan 2026 10:39:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfhFREy9IapMkV7sWbkbBuBC8h4F8i4cfhoniI5uiyC+MoB2sNIwZdM7ceRADP+gPHbYRBqw==
X-Received: by 2002:a05:7300:2d15:b0:2ae:50d5:bc0f with SMTP id 5a478bee46e88-2b16f91b85fmr2919987eec.26.1767724792168;
        Tue, 06 Jan 2026 10:39:52 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706c503csm5359364eec.15.2026.01.06.10.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 10:39:51 -0800 (PST)
Message-ID: <8ada0f35-9663-4932-b7c1-53c00f3cdf92@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 11:39:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PULL]: Update firmware for Qualcomm AIC100
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE2MSBTYWx0ZWRfX5hsDblKQJ/wx
 rRYQw3vPvEjhC0tCOvZEbk6urYafGjCfOHyOJphD0MmzKLig6AsqbmTDV6qiBVu2sQiy9QaR9Pz
 KSz++ZMEWrEIuX2gEexblTx0PopLapNEG/KAGre/x5XmvAVY5nJY5kw/eMCaNWVvtg57hgtANPl
 7cynRco2yaHIY3ayhDNYbCaezctHJF8i7f5C2CG72DG+pCSlSzI3hsOxGFtAxk57CkgRYkBV3MW
 rKKd50oeks52wQOwbWFor7tD7GAudEMHvKigi+Fulolxw0JBv7usrX0xp/Wb2JGu28PYf7ICLRY
 3viCrfA+MFWcLUtTutduUXaG1ZnGvZ8zCK1vg4T6OkslAKL3slz79udPTfyqaLG8w4+NWBuH7jc
 RahhUeUIONWyiW/0kvzvlLi63WTf2a7Ysw1X01jzBGT1S8oYRhkUp94LCQKJQzE9+rmsPBL7ku6
 wXXXF6bTGCDskJV44yQ==
X-Authority-Analysis: v=2.4 cv=YqIChoYX c=1 sm=1 tr=0 ts=695d56fa cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=54DGScOwRhmUFBVweLsA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: stXB2azgzU1au0pisEXBTD7TJEwt3Z9h
X-Proofpoint-ORIG-GUID: stXB2azgzU1au0pisEXBTD7TJEwt3Z9h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060161

The following changes since commit 61a76356fe7fc29479fef362abc1f47bb40eb52f:

   Merge branch 'upd-wcn6750' into 'main' (2026-01-06 15:37:35 +0000)

are available in the Git repository at:

   https://github.com/quic-jhugo/linux-firmware aic100_1_20_2_7

for you to fetch changes up to 3ff97fca3cccae8c68b14c3bfe9785f25287bf1a:

   qcom: Update aic100 firmware files (2026-01-06 11:25:03 -0700)

----------------------------------------------------------------
Jeff Hugo (1):
       qcom: Update aic100 firmware files

  qcom/aic100/fw1.bin | Bin 2180920 -> 2180920 bytes
  1 file changed, 0 insertions(+), 0 deletions(-)
