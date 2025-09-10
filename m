Return-Path: <SRS0=sC6J=3V=oss.qualcomm.com=xin.liu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9980FCAC582
	for <linux-firmware@archiver.kernel.org>; Wed, 10 Sep 2025 02:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B5F3C4CEF5; Wed, 10 Sep 2025 02:49:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 69FCAC4CEF4
	for <linux-firmware@kernel.org>; Wed, 10 Sep 2025 02:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 69FCAC4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589Hqxn6030492
	for <linux-firmware@kernel.org>; Wed, 10 Sep 2025 02:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0TFtc4WHPoI8s9cpsedVtb3i
	bIDHkDBf9wnOsbSMrC0=; b=kAFoV2zenv2mJjGfOaSJduIELTHXTuIpiQpbHevB
	wf9Q6HO4AarbbfL3kmcmaqGxMthcxCRC1nX2YdikzOSDMErX7S8xAxJo3SqG/8II
	jC5Zn7PT3aRjSAj75usOHNhi7O40csjGNvAy+WBUvaD4AOjLTEi4J5vORtY6QgV4
	En97wzTx3Pvch9XoB4+kIWfDYKgV/zwx2uRaVNkwpIYfWkkrwGBtmpoMvGByCUhj
	08wMXQaGECnhxdxBjEV4fQ5c2IA+atJ87+ZsjTh/S+TPD1BuZtbWGkXAc2kBJIOp
	I+x6dcZewuhxF+ICNmkp93dt/LxlO5VCJ9sm3putCi52Uw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9jaejx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 10 Sep 2025 02:49:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2507ae2fb0fso41924025ad.0
        for <linux-firmware@kernel.org>; Tue, 09 Sep 2025 19:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757472545; x=1758077345;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TFtc4WHPoI8s9cpsedVtb3ibIDHkDBf9wnOsbSMrC0=;
        b=NNVjsVLWUv1wsJiOrh2SIG3Jr2LdgP63lFe095stu1UFm72F4wK+OAwrrmIH/qHCZX
         yjQGhGafRCcTbQGGzCSr4WfpXVIUkmaXmcBDl8V0dyzIXMx/7gnfaUINtqwLpc4IznMS
         Y3ohEmerWRcAC+2kBJUobs8CLfZjCZJ+gNAndFar44TvopzxPg6C/A7pTXtmUJnaANlu
         HLul1u7OcDT5Wrgkx3ztUiXdgTC3o9S7EKZ28wPfbZDCDQv1bSqfzZTqY8XRFuabo4ek
         KX8K70n/Orc59NMZ46WBMPrXEtF4pQ3YeREqX3BeRwanHOjgrESbWVMF+dJsLNOt2uYt
         CK9g==
X-Gm-Message-State: AOJu0YwkJPUZ00MEXndiJ6PeEqbB9BGOZnr1B836hjpLaujLqbvGMVyh
	Xrvr0Dr0KheX4pVXltS/F/1zAxNJyToepkba/sKS3m9gkD1m/R/9Wlg8+w8oJcB3j6H+oALv3Yu
	rF7zeCdWAtGubnrUppWUBe7GijfmhP4EuwtAelZiZxc/sBnTkYiujSplwTI7Ow2Y=
X-Gm-Gg: ASbGncv9LqyQjb3a0tLE4k5K9rg5ba3uJSv4UhrN6T44ifqjh4pbrq2xsN5e3orkozO
	gibqdX1U+H5FqBzgJIs9YMLyfnlgmYWiM9+OEqk8Cx7kB4YXN4gjsK9UZR857WdPgyRy1jPmdz0
	Rv1rGs54nHG659lK2T/EEZsOZQKLNQKILBgddASWsctkXOO3c6db/SjEAzjaixNTgH7gffHpJ9v
	8cmjXCtLUeqLGTyjgMg7s3SyrKOzWQdiE7gR2GObnNfD8TktvyY0NLZgbnhq0WeaDMgbyaJW3Nh
	Pm1SgYmzdgU4ZaK2f0i+8qSWtf59EUbXZDH7xuOMMu2Pg2BnhOcWMsyvbi2eHeFyWXgMCJaaufc
	DzDFteBKmRkTPljBZqgd5NA6LnO08
X-Received: by 2002:a17:902:e843:b0:24b:1692:e0bf with SMTP id d9443c01a7336-25173118d74mr235583075ad.31.1757472544568;
        Tue, 09 Sep 2025 19:49:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgjtXJ7DItYKLYu5UqupvnGfM/VRObsXzI7RMoLwxYemJQe1yT2amCIBMvKE37QJYpr0CWFw==
X-Received: by 2002:a17:902:e843:b0:24b:1692:e0bf with SMTP id d9443c01a7336-25173118d74mr235582675ad.31.1757472543932;
        Tue, 09 Sep 2025 19:49:03 -0700 (PDT)
Received: from [10.133.33.76] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dbb62533fsm603645a91.25.2025.09.09.19.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 19:49:03 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------apvxT0zWO0lzAxgXEB50FAXl"
Message-ID: <222bd1a5-2b09-4c31-9277-88508bfbdf5a@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 10:49:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: add CDSP firmware for qcs615 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jianping.li@oss.qualcomm.com
References: <cd3515c6-5a63-40e7-8399-84de460b2f5c@oss.qualcomm.com>
 <w4uprcv2dvzojojm2sy2vc6i63m2v6f2cwrf2play765w6pzaa@lzikj4gxzdoy>
From: Xin Liu <xin.liu@oss.qualcomm.com>
In-Reply-To: <w4uprcv2dvzojojm2sy2vc6i63m2v6f2cwrf2play765w6pzaa@lzikj4gxzdoy>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfXyT4JUflI3Skn
 dPSVyoTMLYOYQfqwts1BeYAV7i6ovEwh8O9HL4v5PDnjWat8AEb0dEIjbx8Z1I/LPjRpVPPB1YR
 rnyT2GVJ+ZmKFbXJH9UJ3Fh0HEW0++zhSEhM3vIKg8Z8O30+HoI3DGXOIQ9q1uZdOL3VAWMSnVN
 CRaEu/UDVT4DPXI322UEtjseI1holE+8wFMho3yxeDvcvLMfJTgahOXoA3l7Jz04wnaTeZtXy6b
 Jy1Xp9rNWnDwEdpkpYo0r0sfwQ8fwrSkjJ8MmmmEccSzoq9JqFanBZryBOZ0naQF+4z4dMt+TtB
 F2HTtq7LsYYBKvFYrKAs+m+krgicfGgr5DZM6e1YKLr4KBCI5CEup+CDT4JhqOp1QjDVTNRlzpF
 NhcAjhFg
X-Proofpoint-ORIG-GUID: eZ9xfHIi3DVI1xEw8WEXEsTuMWiBxL2Q
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68c0e722 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=yJojWOMRYYMA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=qC_FGOx9AAAA:8
 a=opv2dWkda2A7FBc8wycA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=jwNm84Q-_J1sRLibxukA:9 a=pjX-9N7onv8oRYuK:21 a=_W_S_7VecoQA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: eZ9xfHIi3DVI1xEw8WEXEsTuMWiBxL2Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

This is a multi-part message in MIME format.
--------------apvxT0zWO0lzAxgXEB50FAXl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/5/2025 9:42 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 05, 2025 at 10:39:46AM +0800, Xin Liu wrote:
>> The following changes since commit 577ee67ffca254fe7ee3a7dc5bcf0b8f749f2902:
>>
>>    Merge branch 'robot/pr-0-1756931524' into 'main' (2025-09-03 20:41:46
>> +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> qcs615-cdsp-9
>>
>> for you to fetch changes up to 82b34c45e9ffbc2894a7a870701c24ce9a30e734:
>>
>>    qcom: add CDSP firmware for qcs615 platform (2025-09-05 10:08:14 +0800)
>>
>> ----------------------------------------------------------------
>> Xin Liu (1):
>>        qcom: add CDSP firmware for qcs615 platform
>>
> Xin Li, could you please also submit ADSP and CDSP Hexagon libs to the
> hexagon-dsp-binaries repo.

Hi, Dmitry. My colleague Jianping will send libs to the 
hexagon-dsp-binaries repo.

--------------apvxT0zWO0lzAxgXEB50FAXl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/5/2025 9:42 PM, Dmitry Baryshkov
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:w4uprcv2dvzojojm2sy2vc6i63m2v6f2cwrf2play765w6pzaa@lzikj4gxzdoy">
      <pre wrap="" class="moz-quote-pre">On Fri, Sep 05, 2025 at 10:39:46AM +0800, Xin Liu wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">The following changes since commit 577ee67ffca254fe7ee3a7dc5bcf0b8f749f2902:

  Merge branch 'robot/pr-0-1756931524' into 'main' (2025-09-03 20:41:46
+0000)

are available in the Git repository at:

  <a class="moz-txt-link-freetext" href="https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git">https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git</a>
qcs615-cdsp-9

for you to fetch changes up to 82b34c45e9ffbc2894a7a870701c24ce9a30e734:

  qcom: add CDSP firmware for qcs615 platform (2025-09-05 10:08:14 +0800)

----------------------------------------------------------------
Xin Liu (1):
      qcom: add CDSP firmware for qcs615 platform

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Xin Li, could you please also submit ADSP and CDSP Hexagon libs to the
hexagon-dsp-binaries repo.
</pre>
    </blockquote>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Hi, Dmitry. My colleague Jianping will send libs to the hexagon-dsp-binaries repo.</span></p>
  </body>
</html>

--------------apvxT0zWO0lzAxgXEB50FAXl--
