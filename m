Return-Path: <SRS0=uGjr=AR=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4816CEF48CD
	for <linux-firmware@archiver.kernel.org>; Fri, 13 Feb 2026 04:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0A5B8C19424; Fri, 13 Feb 2026 04:32:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1464CC116C6
	for <linux-firmware@kernel.org>; Fri, 13 Feb 2026 04:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1464CC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CLFWlO4033263
	for <linux-firmware@kernel.org>; Fri, 13 Feb 2026 04:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MRi2CZu8aOrHtGhNlyFDcz
	VsN05fU5Q8DnNmY8duY+4=; b=KuLoMj3SOds5zpTyplx6HzFw8vYaDIDHJpvbjX
	3XnGu+gZvwQ3NWL/FIjMBXO4COHeIWIPNPSVoebBdgaeG8PzKIqLuN3TWWXRyMtY
	tqm+pbJ+bHW8m1ptuCvRnGtFZvO2qgLmEFuYR0z7jFrITx6wejKr8hWJQnSPgzzX
	sA3HpCz8k5ts2AxsACIex/RDGVd21JEywJ+JO8zQf86v2ZWmKFNPiFg9FHLqV26D
	IcQWZkF6WcFIBMnAQWml9QqhunNjNIPsgh+XtHHIwME7WgXA6bXFXRScC5oUbUk/
	3r0IDb14MUPknSzidKUUFTUTAwIz+2D+Y89l7Fh9UFlXGE0A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ck2kpyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 13 Feb 2026 04:32:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aae3810558so6467265ad.0
        for <linux-firmware@kernel.org>; Thu, 12 Feb 2026 20:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770957122; x=1771561922; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRi2CZu8aOrHtGhNlyFDczVsN05fU5Q8DnNmY8duY+4=;
        b=XmWGdpChUFaxQFX0YQ3khezrTKdtIoFnPvyHhF4Qcx0VnOHcwR9rru//zfCxDeBIyJ
         lU0p7My29Z2xi60dBInGwH3L+Y+8aDDTlssyOoGUvaTHwGbkahwboR9nFTo5Hg+id5Yf
         UND+InBRe7cHHFtH70a7FliYghVdKBy85bJaUNLQLvqQFQXmJ5XzcEDogYvuaqNUPebB
         fDu+h7BldjxoOsiSypbaD2cfs0kmZ/Zb4UHXVknXQ4lIaj2tgD/1SAD+36HMyA3FjfLi
         B6fvommLsMUyAGYa5BVGzD3uc1MzeDf+osFVE6C6xTSBYhOE8jUEy0WyuKlLIENPz4qj
         F6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770957122; x=1771561922;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MRi2CZu8aOrHtGhNlyFDczVsN05fU5Q8DnNmY8duY+4=;
        b=FGMW0N1vSom7HckwtoOJgaL+aaHhhuQPki/YOy5I+z/8el67EVLrAdei+NLmN8lvvl
         N8pHSmHsfR34gSfy+DEwKP031EUpUBKIYFrRQecpzGqWzjXz+pcpChCLEtL7XuYYER+q
         ZONE34HEsGYRykf2FjYgp/z03epnG9XqmH8kPNde5KEZtOE88kRmGjnSp0hDjp7gOTBb
         ILQCVskW3g7yrmCiVsa0TXMgrPiktjWlCiNMwldmXgtvaSVWpaS+9nF+RzoOEnMfPHo/
         iGe6ch5hm3YKFvd1P47pNcMV26SfDcCKOnP/wY3kxMVibzH1n/8crHT48MoR0QrHMYMm
         CGSw==
X-Gm-Message-State: AOJu0YxVtWuInTr1YZcmXP7luNEoinndylVaWbeFTad1bt8PkbTte1es
	kuE6Ieb7rYSQU5awSHMkyq2E3JD35thzipOKtq0UQ8W1O37tVI4GqCbyJc03SPq0+OjTGr9af8B
	nxzsf6ceE7GXykDyQSyoeSinbLzPqwf6r764udN84BNH1N0cZ9oaX6lNnL44CUYlrTyJYMHQ=
X-Gm-Gg: AZuq6aIjuzoeRcyk2vHRq1WP+R/iwtw0q58zkq2tlIUKnyE+OEhSEtDD6eYYN66c5Nz
	DcpNnaeW+Y8jSxi1ztcJSJWKxz1zc+3OE0H74yexRO1lyEUwSrPHWLLScTleTZ3n6kYEQ5Fi4oX
	mw1cCF2rem+lr3V2QrIrtL0pXtd4L+/+RZSby51azlw+twO4KWcD0se+vGPc32QlKMN+z46a+tM
	ZGVbra6V/5ob/uFDTY5PLKeDWVXjOb0fs1PwmJh/QLqtOTGez/uiQYcPIY14sLKz4ZEidPM5Sg1
	kZnx91OhBOBJSennkBKx1K6ULAadFRYOJOcOPqdodDX54uzZgiPtDaOXD7OjH0LUIjU78Hc5+ep
	x9Q8j7PbWC8+Dtlfvgc16wQjczxf7DQPSz8uC0YwFwF2KByqu
X-Received: by 2002:a17:902:f787:b0:2a7:9948:45a4 with SMTP id d9443c01a7336-2ab50569112mr5810535ad.25.1770957122183;
        Thu, 12 Feb 2026 20:32:02 -0800 (PST)
X-Received: by 2002:a17:902:f787:b0:2a7:9948:45a4 with SMTP id d9443c01a7336-2ab50569112mr5810315ad.25.1770957121651;
        Thu, 12 Feb 2026 20:32:01 -0800 (PST)
Received: from [10.216.7.62] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2997b3e3sm68710385ad.72.2026.02.12.20.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 20:32:01 -0800 (PST)
Message-ID: <b35b6510-e191-46af-ab97-d73b2a7d3ce3@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 10:01:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: psaddam@qti.qualcomm.com
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update DSP firmware for sa8775p platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cd7fb3DM c=1 sm=1 tr=0 ts=698ea942 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=qC_FGOx9AAAA:8 a=xMo8kFbb12n46hDFsjAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDAzMSBTYWx0ZWRfX3ZyfuafUgMLV
 heNAYz4FGoQuShTM2mgsPxSd0pl6zjS5mrDUGWirnctThSWOSusYf/oRffUBteM+Ew2hzNUfZAI
 sswyedBQvWG4jCizE0H7Yu/sHQn5NCqoVy2CPiEm6e/x3ZSY0pLJMFZAWUJ4faY0NhMUA1EzZSC
 9wVaWY3+lDcTpQVCpZV/BqvCvximHO1wI00T7j35N9748+VBQtMUm3hQWmq9vHkGTJHcfpOUYeH
 5QsgD1xvNk3k86PgbBRYPiwdAMBzKwadSVVvrbrlUZwKh+OC4zBkcKfUy14lFMUhYo0HuVGhlUu
 gWmarIiiaKwKjgojN5YmP4ZMZ6pPpO792Xte1VAHahbQmsZtOmHEzSebebMSOnABeGYtBKOlqz5
 iPoeL8oEGeQhCaTJ96pDEVyvVc7NNCaFz/Vye3OetwK8LlFJbArmB3nbJ22p+5ZthJ2nYs1c+7j
 pJN1PX4XtSFLOUI0KYA==
X-Proofpoint-GUID: TVk3TL0Iptnw25S2dIFD16uhq3oxwnRX
X-Proofpoint-ORIG-GUID: TVk3TL0Iptnw25S2dIFD16uhq3oxwnRX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602130031

The following changes since commit 92576358fe5ada6724c1c9572aa992ea43531ae1:

   Merge branch 'amd-staging' into 'main' (2026-02-13 02:00:28 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-lemans

for you to fetch changes up to 664f8b6adeba20be0960d9cb1b2ad8c5a4d7e0e3:

   qcom: Update DSP firmware for sa8775p platform (2026-02-13 09:47:58 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update DSP firmware for sa8775p platform

  WHENCE                  |  10 +++++-----
  qcom/sa8775p/adsp.mbn   | Bin 6795264 -> 6799360 bytes
  qcom/sa8775p/cdsp0.mbn  | Bin 3162112 -> 3170304 bytes
  qcom/sa8775p/cdsp1.mbn  | Bin 3162112 -> 3170304 bytes
  qcom/sa8775p/gpdsp0.mbn | Bin 5992448 -> 5992448 bytes
  qcom/sa8775p/gpdsp1.mbn | Bin 5959680 -> 5959680 bytes
  6 files changed, 5 insertions(+), 5 deletions(-)
