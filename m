Return-Path: <SRS0=WwDY=7R=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3B2D2502F
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Jan 2026 05:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2BF90C19422; Mon, 12 Jan 2026 05:42:59 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 54693C116D0
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 05:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 54693C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BNmP4j3305943
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 05:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JC53QCL/ZsKEtFbxqLw+Ec
	ldBMPFduKzmXvQymJvG+U=; b=Eapku7N0i1uX71MiOYmGmZMNHxEJP5E/qSOR1Z
	YGjzl/G1HTuU2MHwCqrIsUcLqmDQW7WoMrz+sfqQyRLhCxkHMNlWk2E7YxBKk1pv
	DN2xfZFCcw2Avxw2BBDD/BxHoOcRkmNVj00v7XCEhEEm/HgkIH712sycsSqr6R+3
	VF8nl/MMw0Qm4tViwV6FqGpWObDn8XDZzZ4DfNiWbNQFMCmmhx0yUneE/Azy8Zi7
	46qbwy3zg9polqTBeSuP5Vogq7bFHoMIyAIxhJ6KA6nOx1S6vatEn+O+ffWEY/y5
	k6v3QfriN4ylBeZ1BPu+IgPf/Wx99bV1h+1Tqvieg7vAnXuw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntuk2ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 05:42:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0dabc192eso61625365ad.0
        for <linux-firmware@kernel.org>; Sun, 11 Jan 2026 21:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768196576; x=1768801376; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JC53QCL/ZsKEtFbxqLw+EcldBMPFduKzmXvQymJvG+U=;
        b=QfKw1MiAK/rFPEAOnGLgKrpQ8yKJgMuuczlw6ZlVWGqDeaOPSspYmMrCHfK84Ojms3
         My5yycBmGunj03CXmAip4p5JnmBrUi1lHl+P8IlYHcH4dGZ6NnxKGLJDQnX5dcvc5Xf1
         fle4v7JHZQZuANDiw5hy0chwqOqezCHHBly1VX6SqRV8JyE9T8Opg0kwzrUrjOnr+vx5
         e1kYW0alZF89GufgPwjrltzY9eq1JadSzb/aedcCDBua0ZThiGQWyIXMzpXmgqrlsSG5
         V+YNQIYlTQzsvhvT9FixgW2iw3Y6+fZc+UyzzQxZTGAGgRKK+riyec9gZ3ssvCk4AOWN
         WYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768196576; x=1768801376;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JC53QCL/ZsKEtFbxqLw+EcldBMPFduKzmXvQymJvG+U=;
        b=V93JTgQzHsjVxREOM1BqxNSUzLgzF6fUNjUqrhmo0lsCzgRnrAya/pnDlnOQ59hP39
         ov2eKQFLIM6Vajhm2978THWQuQqpaF4r1h7Nv+tsJZyug15PuY1OVBLQhjWYk4DYCzXR
         apcveBKAn4SZg34n9VpeoPYUfgvCtGYSImK1rmX2brlusxFhUN0yzj+Ph0eUoHxJabu5
         ZM7aHcBD5+E6CG4gTgRelVBYJXUWgr3EyLNkHIwzTAh+LoG41MzOA7l9VPSu/jr0ryqB
         zK8uolOBWezXhgrgaJlg+gck10VSXk0+1UhzpWPeVUxl61rnvp6Tcrruro+lwMjUivs2
         pX1Q==
X-Gm-Message-State: AOJu0YwXxFWcbzEbEvvW3mVx9u7g1EI5amDWPGzhtCwfO2g/PsB54D1/
	1UDZzR8kD0Gh+KS2K92YX/cwgZMwefwMdxZAcowfkQT+s6olqFKYeQ/oZQtGr45Oz7rb15jw1Gw
	kbXbmgNqY3lvHwQBRlaRffU+8LtxMv76IBoiW1UdhNIlkixIjQSf3yj7XBpdePQ33xvROps4=
X-Gm-Gg: AY/fxX6kSOi0XTQs7b1cGnxk734Y6wcx+23nC1aoyTedsRr+8nvCpLS5MdmLXw4gekR
	ccOpsEq5d0yhMmLLLt+JlbkKVUbbJ9DbHi35vRq4MEYbs1IMz9kv1JSzSgNHTmoHapCsVjUwlHn
	3g8tiKth4tg18HewsxC1+SM7xnSJruyGYcl2a51NusXvqI5t+cd4yx4dWiQBYSpvKELOIE/x9b3
	wJBv7zsx4hZSR60F0v2QzJWBbxEr3PaC9fM1ycJxSo9tsMh2iwO0qrjwXCXChLWpqNHZUtWMwoq
	OaRXqz55wZzAFt5L5OdUdjKkrenGZVO8OlWm7x4Cgb7IwG06mHB8aTmMWjdN3yqpiwMp/F2as2N
	6KDP8B9yCgdbwKQMcAWMVJFul54/DH7nK0UD69w==
X-Received: by 2002:a17:902:e841:b0:2a1:3cd9:a739 with SMTP id d9443c01a7336-2a3ee4cae56mr165883915ad.43.1768196576386;
        Sun, 11 Jan 2026 21:42:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbiRji161vgrMnfZRfcu+acAG+mKsz+XmnWGCZVncH3F6qyGwLXAkWj54ufZ+0h8NGKyDa7g==
X-Received: by 2002:a17:902:e841:b0:2a1:3cd9:a739 with SMTP id d9443c01a7336-2a3ee4cae56mr165883785ad.43.1768196575873;
        Sun, 11 Jan 2026 21:42:55 -0800 (PST)
Received: from [10.204.86.35] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5de6405sm16482886b3a.61.2026.01.11.21.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 21:42:55 -0800 (PST)
Message-ID: <89b5d0b8-9928-40ca-b8eb-f40080b6f3be@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:12:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update ADSP firmware for qcm6490 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA0MyBTYWx0ZWRfX4U71rMSIFFor
 pR6Zgk8pZjsDbEvSk8n/A4kZnPyMlOwB8M1OIyui6mWomaBaxl268r7hMOaqt7uGYwtiTYIhV6I
 aG405cdOl+EMedFgBxiGI2xCZl9rSZYuNbe0nwb3RmaGdnXTenpYgXKLSjcNuGl8yW06bvn+pZw
 ehJDvlnhMrZQu1/mikMrKhxa+KeEHUoqbnKjWCp0TybYO1GPCVfkHc0LyLERRJLcmHyzDCajNEG
 a8x4Pa3hUeh0egV3fCiW9enVbrftz7pZMgVHIAxzWowqLGFjfVD7K8TQFegf4en5hXQACvFn0hb
 G+jlfVJoC4SnsigS/8WZ1GseJ9tQ43oEis5UQLrvwwH0Yp+ejE+lhlTgyCXvo53MQC16b1xKzdv
 4eebkpLYljsabLoICHaIiFmxqghomnp2u58lZ6Epa67JiDf6yLYOFpfDQMP+osIb0PlUmI5/bSA
 ek5myvGK/Ld1RM0SoSA==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=696489e1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=Ogdz_8zh5y0U7vwWOyEA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: lP5USz4OjuPDla5Es2ZUdSHDg7OBkrez
X-Proofpoint-GUID: lP5USz4OjuPDla5Es2ZUdSHDg7OBkrez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120043

The following changes since commit fd6473795fc677b981a076e12ff10044d3e5dfa3:

   Merge branch 'main' into 'main' (2026-01-10 20:55:47 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-kodiak

for you to fetch changes up to 1ddcf07a2c4859c6914660a077c5649dc4dab281:

   qcom: Update DSP firmware for QCM6490 platform (2026-01-12 10:42:59 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update DSP firmware for QCM6490 platform

  WHENCE                |   2 +-
  qcom/qcm6490/adsp.mbn | Bin 12693084 -> 12095036 bytes
  2 files changed, 1 insertion(+), 1 deletion(-)
